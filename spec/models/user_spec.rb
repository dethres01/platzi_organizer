require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Model Validation' do
    context 'It should be a Mongo Document' do
      it { is_expected.to be_mongoid_document }
      it { is_expected.to have_timestamps }
    end
    context 'Fields' do
      it { is_expected.to have_field(:email)}
      it { is_expected.to have_field(:encrypted_password)}
      it { is_expected.to have_field(:reset_password_token)}
      it { is_expected.to have_field(:reset_password_sent_at)}
      it { is_expected.to have_field(:remember_created_at)}
    end
    context 'Associations' do
      it { is_expected.to have_many(:owned_tasks).of_type(Task)}
      it { is_expected.to have_many(:participations).of_type(Participant)}
    end
  end
end
