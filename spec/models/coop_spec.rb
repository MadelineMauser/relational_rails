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

  describe 'class methods' do
    describe '.creation_ordered' do
      it 'orders the records by most recently created first' do
        coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5, created_at: Time.now + 10.days)
        coop2 = Coop.create!(name: 'Cluck Hut', is_portable: false, nest_box_num: 6, created_at: Time.now)
        coop3 = Coop.create!(name: 'Roaming Home', is_portable: true, nest_box_num: 4, created_at: Time.now + 3.days)

        expect(Coop.all.creation_ordered).to eq([coop1, coop3, coop2])
      end
    end
  end

  describe 'instance methods' do
    describe '.chicken_count' do
      it 'returns the number of chickens associated with a given coop' do
        coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5)
        chicken1 = coop1.chickens.create!(name: 'Martha', is_broody: false, clutch_count: 3)
        chicken2 = coop1.chickens.create!(name: 'Peeper', is_broody: true, clutch_count: 4)
        chicken3 = coop1.chickens.create!(name: 'Gretta', is_broody: false, clutch_count: 6)
        chicken4 = coop1.chickens.create!(name: 'Pumpkin', is_broody: true, clutch_count: 5)  
        coop2 = Coop.create!(name: 'Cluck Hut', is_portable: false, nest_box_num: 6)
        chicken5 = coop2.chickens.create!(name: 'Big Marge', is_broody: false, clutch_count: 4)
        
        expect(coop1.chicken_count).to eq(coop1.chickens.count)
      end
    end

    describe '.chickens_alphabetically' do
      it 'sorts its chickens in alphabetical order' do
        coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5)
        chicken1 = coop1.chickens.create!(name: 'Martha', is_broody: false, clutch_count: 3)
        chicken2 = coop1.chickens.create!(name: 'Peeper', is_broody: true, clutch_count: 4)
        chicken3 = coop1.chickens.create!(name: 'Gretta', is_broody: false, clutch_count: 6)

        expect(coop1.chickens_alphabetically).to eq([chicken3, chicken1, chicken2])
      end
    end
  end
end
