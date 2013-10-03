class AddPvpStatsToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :pvpresil, :int
    add_column :characters, :pvppower, :int
  end
end
