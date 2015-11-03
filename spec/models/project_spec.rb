require 'rails_helper'

describe Project, :type => :model do
  subject { FactoryGirl.create(:project) }
  it { is_expected.to respond_to :company }
  it { is_expected.to respond_to :project_user_roles }

  describe '.active' do
    let!(:active_project)   { FactoryGirl.create(:project, active: true) }
    let!(:inactive_project) { FactoryGirl.create(:project, active: false) }
    subject { described_class.active }
    it { is_expected.to match_array [active_project] }
  end
end
