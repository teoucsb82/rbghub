class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :role1
      t.string :role2
      t.string :role3
      t.string :role4
      t.string :role5
      t.string :role6
      t.string :role7
      t.string :role8
      t.string :role9
      t.string :role10
      t.integer :rbgdate
      t.integer :rbghour
      t.integer :rbgmin
      t.integer :rbgzone
      t.integer :rbgdurationHour
      t.integer :rbgdurationMin
      t.boolean :isAvailable
      t.boolean :recurs
      t.integer :rolesNeeded
      t.integer :classesNeeded
      t.boolean :listed
      t.string :description

      t.timestamps
    end
  end
end
