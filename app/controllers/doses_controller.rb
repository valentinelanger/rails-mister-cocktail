class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    # @ingredient = Ingredient.find(params[:ingredient_id])
    @dose = Dose.new
  end

  def create

    @dose = Dose.new(doses_params)

    @cocktail = Cocktail.find(params[:cocktail_id])
    # @ingredient = Ingredient.find(params[:dose][:ingredient_id])

    @dose.cocktail = @cocktail
    # @dose.ingredient = @ingredient

    if @dose.save
      redirect_to @cocktail, notice: 'Dose was successfully added to your cocktail.'
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to cocktail_path(@dose.cocktail), notice: 'Dose was successfully destroyed.'
  end

  private

  def set_doses
    @dose = Dose.find(params[:id])
  end


  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
