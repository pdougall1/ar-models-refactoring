require 'rails_helper'

describe Operation, type: :model do
  subject(:operation) { FactoryGirl.create(:operation) }
  it { is_expected.to respond_to :project }
  it { is_expected.to respond_to :work_tickets }
end
