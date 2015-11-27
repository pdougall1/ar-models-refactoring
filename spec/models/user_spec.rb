require 'rails_helper'

describe User, type: :model do
  subject(:user) { FactoryGirl.create(:user) }
  it { is_expected.to respond_to :project_user_roles }
  it { is_expected.to respond_to :roles }
  it { is_expected.to respond_to :projects }
  it { is_expected.to respond_to :work_tickets }
  it { is_expected.to respond_to :company }

  let(:admin_role)  { FactoryGirl.create(:role, name: :admin) }
  let(:tech_role)   { FactoryGirl.create(:role, name: "technician") }
  let(:project)      { FactoryGirl.create(:project) }
  let(:operation)    { FactoryGirl.create(:operation, project: project) }
  let!(:work_ticket) { FactoryGirl.create(:work_ticket, operation: operation, user: user) }

  describe '#operations' do
    subject(:associated_operations) { user.operations }
    context 'when user is on a project' do
      let(:other_project) { FactoryGirl.create(:project) }
      let!(:project_user_role) { FactoryGirl.create(:project_user_role, project: project, user: user) }

      context 'and project has operations' do
        let!(:other_operation) { FactoryGirl.create(:operation, project: other_project) }

        it 'has operations belonging to the projects the user is on' do
          expect(associated_operations.pluck(:id)).to eq [operation.id]
        end

        it 'does not have operations for projects the user is not on' do
          expect(associated_operations.pluck(:id)).not_to include other_operation.id
        end
      end
    end
  end

  describe '#work_tickets_for(project)' do
    subject { user.work_tickets_for(project).pluck(:id) }

    let(:not_on_project)      { FactoryGirl.create(:project) }
    let(:not_on_operation)    { FactoryGirl.create(:operation, project: not_on_project) }
    let!(:on_work_ticket) { FactoryGirl.create(:work_ticket, operation: not_on_operation, user: user) }

    let(:other_project) { FactoryGirl.create(:project) }
    let(:other_operation)    { FactoryGirl.create(:operation, project: other_project) }
    let!(:other_work_ticket) { FactoryGirl.create(:work_ticket, operation: other_operation, user: user) }

    let!(:project_user_role) { FactoryGirl.create(:project_user_role, project: project, user: user) }

    it { is_expected.to eq [work_ticket.id] }
    it { is_expected.not_to include other_work_ticket.id }
    it { is_expected.not_to include on_work_ticket.id }
  end

  context 'scopes' do
    let(:admin)        { FactoryGirl.create(:user) }
    let!(:admin_p_u_r) { FactoryGirl.create(:project_user_role, user: admin, role: admin_role) }

    describe '.technicians' do
      subject(:technicians_ids) { described_class.technicians.pluck(:id) }

      let(:tech)        { FactoryGirl.create(:user) }
      let!(:tech_p_u_r) { FactoryGirl.create(:project_user_role, user: tech, role: tech_role) }

      it { is_expected.to eq [tech.id] }
      it { is_expected.not_to eq include admin.id }
    end

    describe '.active_technicians' do
      subject(:active_technicians_ids) { described_class.active_technicians.pluck(:id) }

      let(:active_tech)          { FactoryGirl.create(:user) }
      let(:active_project)       { FactoryGirl.create(:project, active: true) }
      let!(:active_tech_p_u_r)   { FactoryGirl.create(:project_user_role, user: active_tech, role: tech_role, project: active_project) }

      let(:inactive_tech)        { FactoryGirl.create(:user) }
      let!(:inactive_tech_p_u_r) { FactoryGirl.create(:project_user_role, user: inactive_tech, role: tech_role) }

      it { is_expected.to eq [active_tech.id] }
      it { is_expected.not_to include inactive_tech.id }
      it { is_expected.not_to include admin.id }
    end
  end
end
