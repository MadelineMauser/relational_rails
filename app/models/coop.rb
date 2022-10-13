class Coop < ApplicationRecord
  validates :name, presence: true
  validates :nest_box_num, presence: true, numericality: true

  has_many :chickens
end