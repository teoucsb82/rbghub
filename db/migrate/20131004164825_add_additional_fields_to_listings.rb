class AddAdditionalFieldsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :btag, :string
  end
end
