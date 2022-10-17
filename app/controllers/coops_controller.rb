class CoopsController < ApplicationController
  def index
    @coops = Coop.all.order(created_at: :asc)
  end

  def show
    @coop = Coop.find(params[:id])
  end
end