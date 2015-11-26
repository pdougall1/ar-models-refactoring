require 'rails_helper'

describe User, type: :model do
  subject { FactoryGirl.create(:user) }
  it { is_expected.to respond_to :project_user_roles }
  it { is_expected.to respond_to :projects }
  it { is_expected.to respond_to :work_tickets }
  it { is_expected.to respond_to :company }
end
