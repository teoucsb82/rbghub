class AddAchievementsToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :achv2, :int
    add_column :characters, :achv3, :int
    add_column :characters, :achv5, :int
    add_column :characters, :hk, :int
  end
end
