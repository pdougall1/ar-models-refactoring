require 'rails_helper'

describe Company, type: :model do
  subject { FactoryGirl.create(:company) }
  it { is_expected.to respond_to :users }
  it { is_expected.to respond_to :projects }
end
