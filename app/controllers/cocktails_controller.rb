class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @cocktails = Cocktail.where(
        'name ilike ?',
        "%#{params[:query]}%"
      )
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def edit
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to @cocktail, notice: 'Cocktail was successfully created.'
    else
      render :new
    end
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to @cocktail, notice: 'Cocktail was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @cocktail.destroy

    redirect_to cocktails_url, notice: 'Cocktail was successfully destroyed.'
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end


  def cocktail_params
    params.require(:cocktail).permit(:name, :image)
  end
end
