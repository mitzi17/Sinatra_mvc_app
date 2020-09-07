class ChangeColumnNameOnMovements < ActiveRecord::Migration
  def change
    rename_column :movements, :employee_id, :user_id
  end
end
