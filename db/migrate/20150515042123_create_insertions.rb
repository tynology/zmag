class CreateInsertions < ActiveRecord::Migration
  def change
    create_table :insertions do |t|
      t.integer :price
      t.integer :magazine_id
      t.integer :issue_id

      t.timestamps null: false
    end
  end
end
