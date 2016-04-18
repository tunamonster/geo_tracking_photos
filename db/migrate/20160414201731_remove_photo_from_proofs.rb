class RemovePhotoFromProofs < ActiveRecord::Migration
  def change
    remove_column :proofs, :photo, :string
  end
end
