require 'rails_helper'

RSpec.describe Coop, type: :model do
  describe 'validations' do
    it {should validate_presence_of :id}
    it {should validate_numericality_of :id}
    it {should validate_presence_of :name}
    it {should validate_presence_of :is_portable}
    it {should validate_numericality_of :nest_box_num}
    it {should validate_presence_of :nest_box_num}
  end

  describe 'relationships' do
    xit {should have_many :coops}
  end
end
