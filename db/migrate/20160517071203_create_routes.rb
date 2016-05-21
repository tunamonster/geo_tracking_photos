class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.integer :package_id

      t.timestamps null: false
    end
  end
end
