class User < ActiveRecord::Base
  has_many :project_user_roles
  has_many :projects, through: :project_user_roles
  has_many :work_tickets
  belongs_to :company
end
