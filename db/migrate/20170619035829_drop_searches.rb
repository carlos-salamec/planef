class DropSearches < ActiveRecord::Migration[5.1]
  def change
    drop_table :searches
  end
end
