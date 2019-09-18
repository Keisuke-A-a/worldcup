class AddColumnToResult2 < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :point1, :integer
    add_column :results, :point2, :integer
  end
end
