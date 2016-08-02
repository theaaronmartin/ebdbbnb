class ReviewsController < ApplicationController
  def index
    @place = Place.find(params[:place_id])
  end

  def new
      @places = Place.find(params[:place_id])
      @review = @places.reviews.build
  end

  def create
    @place = Place.find(params[:place_id])
    @review = @place.reviews.build(review_params)

      if @review.save
        redirect_to @place
      else
        render :new
      end
  end

  def show
    @review = Review.find(params[:id])
    @place = @review.place
  end

  def update
    @review = Review.find(params[:id])
      if @review.update review_params
        redirect_to place_path
      else
        render :edit
      end
  end
  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to places_path
  end

  private
    def review_params
      params.require(:review).permit(:reviewer_name, :description, :rating)
    end
end
