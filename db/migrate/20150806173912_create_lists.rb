class CreateLists < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :ibu
      t.integer :abv
      t.integer :rating
      t.timestamps null: false
    end

    create_table :lists, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :beer, index: true
    end
  end
end
