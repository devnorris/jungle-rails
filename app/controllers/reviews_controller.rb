class ReviewsController < ApplicationController

  def create
    review = current_user.reviews.new(
      rating: reviews_params[:rating],
      description: reviews_params[:description],
      product_id: params[:product_id])
    review.save

    if review.save
      redirect_to product_path(review.product)
    else
      render product_path
    end

  end

  private

  def reviews_params
   params.require(:review).permit(:description, :rating)
  end

end
