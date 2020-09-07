class UpdateTypeColumnOnMovements < ActiveRecord::Migration
  def change
    rename_column :movements, :type, :season
  end
end
