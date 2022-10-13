require 'rails_helper'

RSpec.describe Chicken, type: :model do
  describe 'validations' do
    it {should validate_presence_of :id}
    it {should validate_numericality_of :id}
    it {should validate_presence_of :coop_id}
    it {should validate_numericality_of :coop_id}
    it {should validate_presence_of :name}
    it {should validate_presence_of :is_broody}
    it {should validate_presence_of :clutch_count}
    it {should validate_numericality_of :clutch_count}
  end

  describe 'relationships' do
    xit {should belong_to :coop}
  end
end
