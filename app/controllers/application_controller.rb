# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authorize_request

  attr_reader :current_user

  def authorize_request
    header = request.authorization
    raise JWT::DecodeError if header.blank?

    token = header.split.last

    jwt = JWT.decode(token, User::AUTH_KEY).first
    @current_user = User.find(jwt['user_id'])
  rescue JWT::DecodeError
    render json: { error: 'Unauthorized access' }, status: :unauthorized
  end
end
