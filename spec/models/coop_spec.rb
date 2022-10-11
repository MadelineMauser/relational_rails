require 'rails_helper'

RSpec.describe Coop, type: :model do
  describe "validations" do
    it { should validate_presence_of :id }
    it { should validate_numericality_of :id }
    it { should validate_presence_of :name }
    it { should validate_presence_of :is_portable }
    it { should validate_presence_of :nest_boxes }
    it { should validate_numericality_of :nest_boxes }
  end
end
