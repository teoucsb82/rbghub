class CreateComps < ActiveRecord::Migration
  def change
    create_table :comps do |t|
      t.string :listplayers

      t.timestamps
    end
  end
end
