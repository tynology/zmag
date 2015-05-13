class AddEditorToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :editor, :integer
  end
end
