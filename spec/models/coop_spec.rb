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

        expect(Coop.all.creation_ordered).to eq([coop2, coop3, coop1])
      end
    end
  end
end
