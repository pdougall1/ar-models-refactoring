class AddUserIdToWorkTickets < ActiveRecord::Migration
  def change
    add_column :work_tickets, :user_id, :integer
  end
end
