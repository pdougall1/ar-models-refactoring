require 'rails_helper'

RSpec.describe Role, :type => :model do
  subject { FactoryGirl.create(:role) }
  it { is_expected.to respond_to :project_user_roles }
end
