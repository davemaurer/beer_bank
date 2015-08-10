class RenameListsToBeersUsers < ActiveRecord::Migration
  def change
    rename_table :lists, :beers_users
  end
end
