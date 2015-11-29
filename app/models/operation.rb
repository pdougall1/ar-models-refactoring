class Operation < ActiveRecord::Base
  belongs_to :project
  has_many :work_tickets
  has_many :users, through: :project

  has_many :active_technicians, -> { active_technicians }, through: :project, source: :users
end
