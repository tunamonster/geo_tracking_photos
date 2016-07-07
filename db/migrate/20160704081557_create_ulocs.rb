class CreateUlocs < ActiveRecord::Migration
  def change
    create_table :ulocs do |t|
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
