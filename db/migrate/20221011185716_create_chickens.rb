class CreateChickens < ActiveRecord::Migration[5.2]
  def change
    create_table :chickens do |t|
      t.string :name
      t.boolean :is_broody
      t.integer :clutch_count
      t.references :coop, foreign_key: true
      t.timestamps
    end
  end
end
