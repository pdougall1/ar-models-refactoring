require 'rails_helper'

describe Project, type: :model do
  subject(:project) { FactoryGirl.create(:project) }
  it { is_expected.to respond_to :company }
  it { is_expected.to respond_to :project_user_roles }
  it { is_expected.to respond_to :operations }

  describe '.active' do
    let!(:active_project)   { FactoryGirl.create(:project, active: true) }
    let!(:inactive_project) { FactoryGirl.create(:project, active: false) }
    subject { described_class.active }
    it { is_expected.to match_array [active_project] }
  end

  describe '.users' do
    let(:user) { FactoryGirl.create(:user) }
    let!(:project_user_role) { FactoryGirl.create(:project_user_role, project: project, user: user) }

    subject { project.users.pluck(:id) }
    it { is_expected.to eq [user.id] }
  end
end
