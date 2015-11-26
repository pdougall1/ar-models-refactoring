class Role < ActiveRecord::Base
  has_many :project_user_roles
  enum name: [:admin, :operator, :technician]
  validates_presence_of :name
end
