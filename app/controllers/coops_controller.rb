class CoopsController < ApplicationController
  def index
    @coops = Coop.all
  end
end