class CreateProofs < ActiveRecord::Migration
  def change
    create_table :proofs do |t|
      t.string :photo
      t.float :longitude
      t.float :latitude
      t.datetime :taken_at
      t.text :ocr

      t.timestamps null: false
    end
  end
end
