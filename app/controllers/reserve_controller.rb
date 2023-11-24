class ReserveController < ApplicationController
  def show
    if reservation.present?
      render json: { reservation:, user:, book: }
    else
      head :not_found
    end
  end

  def update
    if reservation.present?
      book.reserved? ? book.release! : book.reserve!
      render json: { reservation:, user:, book: }
    else
      head :not_found
    end
  end

  private

  def reservation
    @reservation ||= Reservation.includes(:user, :book).find_by(code: params[:code])
  end

  def user
    @user ||= reservation.user
  end

  def book
    @book ||= reservation.book
  end
end
