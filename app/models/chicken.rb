class Chicken < ApplicationRecord
  validates :id, presence: true, numericality: true
  validates :coop_id, presence: true, numericality: true
  validates :name, presence: true
  validates :is_broody, presence: true
  validates :clutch_count, presence: true, numericality: true
  
  belongs_to :coop
end