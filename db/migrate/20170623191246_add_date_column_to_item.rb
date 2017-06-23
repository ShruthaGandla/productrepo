class AddDateColumnToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :date, :date
  end
end
