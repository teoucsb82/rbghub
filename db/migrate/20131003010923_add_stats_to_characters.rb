class AddStatsToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :cls, :int
    add_column :characters, :race, :int
    add_column :characters, :spec, :int
    add_column :characters, :achvpts, :int
    add_column :characters, :arena2, :int
    add_column :characters, :arena3, :int
    add_column :characters, :arena5, :int
    add_column :characters, :cr, :int
    add_column :characters, :ilvl, :int
  end
end
