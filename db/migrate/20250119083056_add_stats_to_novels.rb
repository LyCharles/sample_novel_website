class AddStatsToNovels < ActiveRecord::Migration[7.1]
  def change
    add_column :novels, :views, :integer
    add_column :novels, :favorites_count, :integer
    add_column :novels, :rating, :decimal
  end
end
