class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.date :printdate

      t.timestamps null: false
    end
  end
end
