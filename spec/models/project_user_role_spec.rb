require 'rails_helper'

describe ProjectUserRole, type: :model do
  subject { FactoryGirl.create(:project_user_role) }
  it { is_expected.to respond_to :project }
  it { is_expected.to respond_to :user }
  it { is_expected.to respond_to :role }
end
