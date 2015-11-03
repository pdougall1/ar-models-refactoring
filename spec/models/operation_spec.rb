require 'rails_helper'

describe Operation, :type => :model do
  subject { FactoryGirl.create(:operation) }
  it { is_expected.to respond_to :project }
end
