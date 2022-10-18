class Chicken < ApplicationRecord
  validates :coop_id, presence: true, numericality: true
  validates :name, presence: true
  validates :clutch_count, presence: true, numericality: true
  
  belongs_to :coop

  def self.only_true
    self.where(is_broody: true)
  end
end