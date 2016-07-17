class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :title
      t.integer :issue
      t.string :condition
      t.float :amount

      t.timestamps null: false
    end
  end
end
