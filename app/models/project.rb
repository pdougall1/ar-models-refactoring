class Project < ActiveRecord::Base
  has_many :projects_user_roles
  belongs_to :company
end
