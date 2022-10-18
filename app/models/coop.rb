class Coop < ApplicationRecord
  validates :name, presence: true
  validates :nest_box_num, presence: true, numericality: true

  has_many :chickens, dependent: :destroy

  def self.creation_ordered
    self.order(created_at: :desc)
  end

  def chicken_count
    self.chickens.count
  end

  def chickens_alphabetically
    self.chickens.order(name: :asc)
  end
end