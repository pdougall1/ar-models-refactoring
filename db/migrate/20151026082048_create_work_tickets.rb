class CreateWorkTickets < ActiveRecord::Migration
  def change
    create_table :work_tickets do |t|
      t.integer :operation_id
      t.string :status

      t.timestamps null: false
    end
  end
end
