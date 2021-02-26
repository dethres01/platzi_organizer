require 'rails_helper'

RSpec.describe Participant, type: :model do
  context 'Model Validation' do
    context 'It should be a Mongo Document' do
      it { is_expected.to be_mongoid_document }
      it { is_expected.to have_timestamps }
    end
    context 'Fields' do
      it { is_expected.to have_field(:role)}
    end
    context 'Associations' do
      it {is_expected.to belong_to(:user)}
      it {is_expected.to belong_to(:task)}
    end
  end
end
