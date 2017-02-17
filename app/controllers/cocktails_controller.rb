class CocktailsController < ApplicationController
  before_action :find_cocktail_id, only: [:show, :edit, :update]
  def index
    @cocktails = Cocktail.all # Array of Cocktail instances
  end

  def show
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

  def edit
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  private
  def find_cocktail_id
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, photos: [])
  end
end
