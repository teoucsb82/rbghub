class AddBgTitleToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :bgtitle, :string
    add_column :characters, :arenamaster, :boolean
  end
end
