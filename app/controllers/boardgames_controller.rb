class BoardgamesController < ApplicationController
  def index
    @boardgames = Boardgame.all 
  end

  def edit
    @boardgame = Boardgame.find(params[:id])
  end

  def update
    @boardgame = Boardgame.find(params[:id])
   
    if @boardgame.update(boardgame_params)
      redirect_to @boardgame
    else
      render 'edit'
    end
  end

  def show
    @boardgame = Boardgame.find(params[:id])
  end

  def new
    @boardgame = Boardgame.new
  end

  def create
    # @boardgame = Boardgame.new(boardgame_params)
 
    # if @boardgame.save
    #   redirect_to @boardgame
    # else
    #   render 'new'
    # end

    @boardgame = AmazonProxy.import_boardgame(params[:boardgame][:asin])

    if @boardgame.save
      redirect_to @boardgame
    else
      render 'new'
    end
  end

  def destroy
    @boardgame = Boardgame.find(params[:id])
    @boardgame.destroy
   
    redirect_to boardgames_path
  end

  private
  def boardgame_params
    params.require(:boardgame).permit(:title, :description, :lowest_price)
  end
end
