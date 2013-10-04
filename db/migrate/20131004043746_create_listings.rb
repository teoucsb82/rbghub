class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :description
      t.string :role
      t.boolean :listSkype
      t.boolean :listBattletag
      t.string :toon

      t.timestamps
    end
  end
end
