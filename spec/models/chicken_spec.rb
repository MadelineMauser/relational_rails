require 'rails_helper'

RSpec.describe Chicken, type: :model do
  describe 'validations' do
    it {should validate_presence_of :coop_id}
    it {should validate_numericality_of :coop_id}
    it {should validate_presence_of :name}
    it {should validate_presence_of :clutch_count}
    it {should validate_numericality_of :clutch_count}
  end

  describe 'relationships' do
    it {should belong_to :coop}
  end
  
  describe 'class methods' do
    describe '.only_true' do
      it 'shows only the records where "is_broody" is true' do
        coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5)
        chicken1 = coop1.chickens.create!(name: 'Martha', is_broody: false, clutch_count: 3)
        chicken2 = coop1.chickens.create!(name: 'Peeper', is_broody: true, clutch_count: 4)
        coop2 = Coop.create!(name: 'Cluck Hut', is_portable: false, nest_box_num: 6)
        chicken5 = coop2.chickens.create!(name: 'Big Marge', is_broody: true, clutch_count: 4)

        expect(Chicken.only_true).to eq([chicken2, chicken5])
      end
    end
  end
end
