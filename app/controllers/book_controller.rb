class BookController < ApplicationController
  def search
    render json: book_scope
  end

  def reserve
    book = Book.available.find(params[:id])
    pick_up_time = reserve_params[:pick_up_time]&.to_datetime
    reserve = Reservation.with_code(user: current_user, book:, pick_up_time:)

    if reserve.save
      book.reserve!
      render json: reserve, status: :created
    else
      render json: { errors: reserve.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { errors: ['Book is not available'] }, status: :not_found
  end

  private

  def book_scope
    title = search_params[:title]
    author = search_params[:author]

    if title.present? || author.present?
      Book.where(title:).or(Book.where(author:))
    else
      Book.all
    end
  end

  def search_params
    params.permit(:title, :author)
  end

  def reserve_params
    params.permit(:pick_up_time)
  end
end
