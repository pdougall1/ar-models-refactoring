require 'rails_helper'

describe Role, type: :model do
  subject { FactoryGirl.create(:role) }
  it { is_expected.to respond_to :project_user_roles }
  it { is_expected.to respond_to :name }

  context 'when being instantiated' do
    subject(:invalid_role) { described_class.new }
    it { is_expected.not_to be_valid }

    context 'as an admin' do
      subject(:admin) { described_class.new(name: :admin).name }
      it { is_expected.to eq "admin" }
    end
  end
end
