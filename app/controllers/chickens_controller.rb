class ChickensController < ApplicationController
  def index
    @chickens = Chicken.all
  end
end