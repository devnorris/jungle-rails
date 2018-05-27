class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    review = current_user.reviews.new(
      rating: reviews_params[:rating],
      description: reviews_params[:description],
      product_id: params[:product_id])
    review.save

    if review.save
      redirect_to product_path(review.product)
    else
      redirect_to product_path(params[:product_id])
    end
  end

    def destroy
      @review_id = params[:id]
      @product_id = params[:product_id]

      @review = Review.find(@review_id)
      @review.destroy
      redirect_to product_path(:id => @product_id)
    end


  private

  def reviews_params
   params.require(:review).permit(:description, :rating)
  end

end
