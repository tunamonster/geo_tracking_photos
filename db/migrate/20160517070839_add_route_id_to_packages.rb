class AddRouteIdToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :route_id, :integer
  end
end
