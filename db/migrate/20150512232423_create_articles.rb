class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :description
      t.boolean :copy
      t.boolean :photo
      t.boolean :print

      t.timestamps null: false
    end
  end
end
