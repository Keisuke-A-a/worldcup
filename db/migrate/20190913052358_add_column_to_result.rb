class AddColumnToResult < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :pool, :string
  end
end
