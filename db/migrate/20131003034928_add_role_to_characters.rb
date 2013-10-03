class AddRoleToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :role, :integer
  end
end
