class ReviewsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @review = Review.new(
      book_id: params[:book_id],
      user_id: current_user.id, #devise method
      body:    review_params["body"] #strong parameter
      )
    #what is this?
    @review.save
    redirect_to book_url(@review.book) # can also put params[:book_id] in the parantheses. The method inside right now "@review.book" is for associations.
  end

private

  def review_params
    params.require(:review).permit(:body)
  end

end
