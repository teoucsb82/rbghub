class AddCoreStatsToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :health, :integer
    add_column :characters, :str, :integer
    add_column :characters, :agi, :integer
    add_column :characters, :int, :integer
    add_column :characters, :spr, :integer
    add_column :characters, :ap, :integer
    add_column :characters, :sp, :integer
    add_column :characters, :mastery, :integer
    add_column :characters, :masteryp, :float
    add_column :characters, :crit, :integer
    add_column :characters, :critp, :float
    add_column :characters, :haste, :integer
    add_column :characters, :hastep, :float
    add_column :characters, :armor, :integer
  end
end
