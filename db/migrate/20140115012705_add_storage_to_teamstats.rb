class AddStorageToTeamstats < ActiveRecord::Migration
  def change
    add_column :teamstats, :toon_db, :text
    add_column :teamstats, :european, :boolean
  end
end
