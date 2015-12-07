class ReviewsController < ApplicationController
    def create
      @boardgame = Boardgame.find(params[:boardgame_id])
      @review = @boardgame.reviews.create(review_params)
      redirect_to boardgame_path(@boardgame)
    end

    def destroy
      @boardgame = Boardgame.find(params[:boardgame_id])
      @review = @boardgame.reviews.find(params[:id])
      @review.destroy
      redirect_to boardgame_path(@boardgame)
    end
   
    private
      def review_params
        params.require(:review).permit(:reviewer, :body, :score)
      end
end
