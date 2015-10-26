class Role < ActiveRecord::Base
  has_many :project_user_roles
end
