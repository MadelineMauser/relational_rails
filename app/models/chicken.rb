class Chicken < ApplicationRecord
  validates :coop_id, presence: true, numericality: true
  validates :name, presence: true
  validates :clutch_count, presence: true, numericality: true
  
  belongs_to :coop
end