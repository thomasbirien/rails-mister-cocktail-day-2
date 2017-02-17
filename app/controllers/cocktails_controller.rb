class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all # Array of Cocktail instances
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    #1. Build a new Cocktail instance
    @cocktail = Cocktail.new(cocktail_params)
    #2. If save redirect to show
    if @cocktail.save # valid? + save
      redirect_to cocktail_path(@cocktail)
    else
      #3. Else render the view new
      render :new
    end
  end

  private
  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
