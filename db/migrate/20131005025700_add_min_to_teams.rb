class AddMinToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :mincr, :integer
    add_column :teams, :minilvl, :integer
    add_column :teams, :mintitle, :integer
    add_column :teams, :min2s, :integer
    add_column :teams, :min3s, :integer
    add_column :teams, :min5s, :integer
  end
end
