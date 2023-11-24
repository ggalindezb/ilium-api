class BookController < ApplicationController
  def search
    render json: book_scope
  end

  def reserve
    book = Book.available.find(params[:id])
    pick_up_time = reserve_params[:pick_up_time]&.to_datetime
    reserve = Reservation.with_code(user: current_user, book:, pick_up_time:)

    if reserve.save
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

    scope = Book.all
    scope = scope.with_title_substring(title) if title.present?
    scope = scope.with_author_substring(author) if author.present?

    scope
  end

  def search_params
    params.permit(:title, :author)
  end

  def reserve_params
    params.permit(:pick_up_time)
  end
end
