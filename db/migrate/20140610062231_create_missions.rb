class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :name
      t.integer :reward

      t.timestamps
    end
  end
end
