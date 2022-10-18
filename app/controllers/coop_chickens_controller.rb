class CoopChickensController < ApplicationController
  def index
    @coop = Coop.find(params[:id])
    @chickens = @coop.chickens
    if params[:alphabetical]
      @chickens = @coop.chickens_alphabetically
    end
    if params[:commit] == 'Only return records with more than this number of clutch count'
      @chickens = @chickens.chickens_above_threshold(params[:number_threshold])
    end
  end

  def new
    @coop = Coop.find(params[:parent_id])
  end

  def create
    coop = Coop.find(params[:parent_id])
    coop.chickens.create(coop_chicken_params)
    redirect_to "/coops/#{params[:parent_id]}/chickens"
  end

  private

  def coop_chicken_params
  params.permit(:name, :is_broody, :clutch_count)
  end
end