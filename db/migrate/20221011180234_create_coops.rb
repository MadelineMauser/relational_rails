class CreateCoops < ActiveRecord::Migration[5.2]
  def change
    create_table :coops do |t|
      t.string :name
      t.boolean :is_portable
      t.integer :nest_boxes
      t.timestamps
    end
  end
end
