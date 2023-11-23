class AuthenticationController < ApplicationController
  skip_before_action :authorize_request

  def authentication
    email = auth_params[:email]
    password = auth_params[:password]
    user = User.find_by(email:)&.authenticate(password)

    if user
      render json: { jwt: user.jwt, role: user.role }, status: :created
    else
      head :unauthorized
    end
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
