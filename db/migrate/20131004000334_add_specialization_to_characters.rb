class AddSpecializationToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :specialization, :string
  end
end
