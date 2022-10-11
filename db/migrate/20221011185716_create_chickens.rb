class CreateChickens < ActiveRecord::Migration[5.2]
  def change
    create_table :chickens do |t|
      t.string :name
      t.boolean :is_broody
      t.int :clutch_count
      t.references :coop, foreign_key: true
    end
  end
end
