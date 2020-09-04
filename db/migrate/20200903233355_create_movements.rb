class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.date :date
      t.string :type
      t.string :category
      t.string :destination
      t.integer :box_number
      t.integer :units_quantity
      t.integer :employee_id

      t.timestamps null: false
    end
  end
end
