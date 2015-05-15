class DropInsertions < ActiveRecord::Migration
   def change
    drop_table :insertions
  end
end
