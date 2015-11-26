require 'rails_helper'

describe WorkTicket, type: :model do
  subject { FactoryGirl.create(:work_ticket) }
  it { is_expected.to respond_to :operation }
  it { is_expected.to respond_to :user }
end
