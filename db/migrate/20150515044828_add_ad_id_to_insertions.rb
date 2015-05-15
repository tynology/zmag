class AddAdIdToInsertions < ActiveRecord::Migration
  def change
    add_column :insertions, :ad_id, :integer
  end
end
