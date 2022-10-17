class CoopsController < ApplicationController
  def index
    @coops = Coop.all.creation_ordered
  end

  def show
    @coop = Coop.find(params[:id])
  end
end