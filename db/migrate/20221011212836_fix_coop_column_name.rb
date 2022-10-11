class FixCoopColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :coops, :nest_boxes, :nest_box_num
  end
end
