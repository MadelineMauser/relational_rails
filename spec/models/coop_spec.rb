require 'rails_helper'

RSpec.describe Coop, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_numericality_of :nest_box_num}
    it {should validate_presence_of :nest_box_num}
  end

  describe 'relationships' do
    it {should have_many :chickens}
  end
end
