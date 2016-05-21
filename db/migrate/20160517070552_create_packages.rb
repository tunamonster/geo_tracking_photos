class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.text :address
      t.float :longitude
      t.float :latitude

      t.timestamps null: false
    end
  end
end
