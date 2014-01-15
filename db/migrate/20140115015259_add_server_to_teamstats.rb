class AddServerToTeamstats < ActiveRecord::Migration
  def change
    add_column :teamstats, :server, :string
  end
end
