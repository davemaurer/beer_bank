class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :rating
      t.text :description

      t.timestamps null: false
    end
  end
end
