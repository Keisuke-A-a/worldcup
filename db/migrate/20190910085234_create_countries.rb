class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :pool
      t.integer :ranking_id

      t.timestamps
    end
  end
end
