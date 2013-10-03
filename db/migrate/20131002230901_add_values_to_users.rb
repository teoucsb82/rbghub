class AddValuesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :skype, :string
    add_column :users, :battletag, :string
    add_column :users, :haveMic, :boolean
    add_column :users, :addons, :text
    add_column :users, :aboutMe, :text
    add_column :users, :skill, :int
  end
end
