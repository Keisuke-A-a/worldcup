class AddColumnToResult3 < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :game, :integer
  end
end
