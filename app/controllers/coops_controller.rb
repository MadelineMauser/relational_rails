class CoopsController < ApplicationController
  def index
    @coops = Coop.all.creation_ordered
  end

  def show
    @coop = Coop.find(params[:id])
    @chicken_count = @coop.chicken_count
  end

  def new
  end

  def create
    Coop.create(coop_params)
    redirect_to '/coops'
  end

  def edit
    @coop = Coop.find(params[:id])
  end

  def update
    coop = Coop.find(params[:id])
    coop.update(coop_params)
    redirect_to "/coops/#{coop.id}"
  end

  def destroy
    coop = Coop.find(params[:id])
    coop.destroy
    redirect_to "/coops"
  end

  private

  def coop_params
    params.permit :name, :is_portable, :nest_box_num
  end
end