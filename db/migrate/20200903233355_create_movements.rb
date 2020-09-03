class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.date :date
      t.string :type
      t.string :category
      t.string :destination
      t.string :box_number
      t.string :units_quantity
      t.integer :employee_id

      t.timestamps null: false
    end
  end
end
