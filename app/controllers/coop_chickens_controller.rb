class CoopChickensController < ApplicationController
  def index
    @coop = Coop.find(params[:id])
    @chickens = @coop.chickens
  end
end