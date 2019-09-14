class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.string :member1
      t.string :member2
      t.integer :score1
      t.integer :score2

      t.timestamps
    end
  end
end
