class RenameRankingIdColumnToCountries < ActiveRecord::Migration[5.2]
  def change
    rename_column :countries, :ranking_id, :ranking
  end
end
