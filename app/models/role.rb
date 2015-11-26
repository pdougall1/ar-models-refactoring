class Role < ActiveRecord::Base
  has_many :project_user_roles
  enum name: [:admin]
end
