require 'rails_helper'

describe Operation, type: :model do
  subject(:operation) { FactoryGirl.create(:operation) }
  it { is_expected.to respond_to :project }
  it { is_expected.to respond_to :work_tickets }

  describe '#active_technicians' do
    let(:user) { FactoryGirl.create(:user) }
    let(:role) { FactoryGirl.create(:role, name: "technician") }
    let(:project) { FactoryGirl.create(:project, active: true, operations: [operation]) }
    let!(:project_user_role) { FactoryGirl.create(:project_user_role, user: user, project: project, role: role) }

    subject { operation.active_technicians.pluck(:id) }
    it { is_expected.to eq [user.id] }

    context 'when the project is not active' do
      let(:project) { FactoryGirl.create(:project, active: false, operations: [operation]) }
      it { is_expected.not_to include user.id }
    end

    context 'when the user is not a technician' do
      let(:role) { FactoryGirl.create(:role, name: "admin") }
      it { is_expected.not_to include user.id }
    end
  end

  describe '#users' do
    let(:user) { FactoryGirl.create(:user) }
    let(:project) { FactoryGirl.create(:project, operations: [operation]) }
    let!(:project_user_role) { FactoryGirl.create(:project_user_role, user: user, project: project) }

    subject { operation.users.pluck(:id) }
    it { is_expected.to eq [user.id] }
  end
end
