class AddMagazineIdToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :magazine_id, :integer
    add_index :issues, :magazine_id
  end
end
