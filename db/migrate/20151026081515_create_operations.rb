class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.boolean :status
      t.integer :project_id
      t.string :mode

      t.timestamps null: false
    end
  end
end
