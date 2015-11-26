class ChangeRaleNameToInteger < ActiveRecord::Migration
  def change
    change_column :roles, :name, :integer
  end
end
