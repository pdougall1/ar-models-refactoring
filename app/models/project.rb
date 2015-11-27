class Project < ActiveRecord::Base
  has_many :project_user_roles
  has_many :operations
  belongs_to :company

  scope :active, -> { where(active: true) }
end
