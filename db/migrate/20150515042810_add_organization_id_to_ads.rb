class AddOrganizationIdToAds < ActiveRecord::Migration
  def change
    add_column :ads, :organization_id, :integer
  end
end
