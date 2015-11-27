class User < ActiveRecord::Base
  has_many :project_user_roles
  has_many :projects, through: :project_user_roles
  has_many :roles, through: :project_user_roles
  has_many :operations, through: :projects, source: :operations
  has_many :work_tickets
  belongs_to :company

  scope :technicians, -> {
    joins(:project_user_roles).joins(:roles).where(roles: { name: 2 })
  }

  scope :active_technicians, -> {
    technicians.joins(:projects).where(projects: { active: true })
  }

  def work_tickets_for(project)
    work_tickets.joins(:operation)
      .where(operations: { project_id: project.id })
  end
end
