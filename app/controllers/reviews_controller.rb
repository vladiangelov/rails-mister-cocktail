class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @review = Review.new(review_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    @review.save

    redirect_to cocktail_path(@cocktail.id)
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
