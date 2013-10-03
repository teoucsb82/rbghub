class AddGenderToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :gender, :int
  end
end
