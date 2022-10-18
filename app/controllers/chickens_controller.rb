class ChickensController < ApplicationController
  def index
    @chickens = Chicken.only_true
  end

  def show
    @chicken = Chicken.find(params[:id])
  end

  def edit
    @chicken = Chicken.find(params[:id])
  end

  def update
    chicken = Chicken.find(params[:id])
    chicken.update(chicken_params)
    redirect_to "/chickens/#{chicken.id}"
  end

  def destroy
    chicken = Chicken.find(params[:id])
    chicken.destroy
    redirect_to '/chickens'
  end

  private

  def chicken_params
    params.permit(:name, :is_broody, :clutch_count)
  end
end