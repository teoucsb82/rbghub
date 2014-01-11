class CreateTeamstats < ActiveRecord::Migration
  def change
    create_table :teamstats do |t|
      t.text :input

      t.timestamps
    end
  end
end
