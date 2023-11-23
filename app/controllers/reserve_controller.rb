class ReserveController < ApplicationController
  def show
    reservation = Reservation.includes(:user, :book).find_by(code: params[:code])
    user = reservation.user
    book = reservation.book

    render json: { reservation:, user:, book: }
  end

  def update
    reservation = Reservation.includes(:user, :book).find_by(code: params[:code])
    user = reservation.user
    book = reservation.book

    book.reserved? ? book.release! : book.reserve!
    render json: { reservation:, user:, book: }
  end
end
