require 'rails_helper'

describe Project, :type => :model do
  subject { FactoryGirl.create(:project) }
  it { is_expected.to respond_to :company }
  it { is_expected.to respond_to :project_user_roles }
end
