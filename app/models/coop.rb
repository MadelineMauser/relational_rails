class Coop < ApplicationRecord
  validates :id, presence: true, numericality: true
  validates :name, presence: true
  validates :is_portable, presence: true
  validates :nest_box_num, presence: true, numericality: true

  has_many :chickens
end