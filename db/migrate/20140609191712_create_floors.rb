class CreateFloors < ActiveRecord::Migration
  def change
    create_table :floors do |t|
      t.string :type
      t.string :name
      t.boolean :is_owned

      t.timestamps
    end
  end
end