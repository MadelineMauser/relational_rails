class CoopsController < ApplicationController
  def index
    @coops = Coop.all
  end

  def show
    @coop = Coop.find(params[:id])
  end
end