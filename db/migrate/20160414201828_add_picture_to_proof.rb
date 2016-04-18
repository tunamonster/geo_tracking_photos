class AddPictureToProof < ActiveRecord::Migration
  def change
    add_column :proofs, :picture, :string
  end
end
