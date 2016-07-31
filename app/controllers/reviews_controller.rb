class ReviewsController < ApplicationController
  def index
  end

  def new
      @place = Place.find(params[:place_id])
      @review = @place.reviews.build
  end

  def create
    @place = Place.find(params[:place_id])
    @review = @place.reviews.build(review_params)

      if @review.save
        redirect_to place_path
      else
        render :new
      end
  end

  def update
    @review = Review.find(params[:id])
      if @review.update review_params
        redirect_to place_path
      else
        render :edit
      end
  end

  private
    def review_params
      params.require(:review).permit(:reviewer_name, :description, :rating)
    end
end
