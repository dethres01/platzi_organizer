require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'It should be a Mongo document' do
    it { is_expected.to be_mongoid_document }
    it { is_expected.to have_timestamps }
    describe 'It should have fields' do
      it { is_expected.to have_field(:name).of_type(String)}
      it { is_expected.to have_field(:description).of_type(String)}
    end
    describe 'It should have many Tasks' do
      it { is_expected.to have_many :tasks }
    end
    context 'Validations' do
      context 'presence' do
        it { is_expected.to validate_presence_of(:name) }
        it { is_expected.to validate_presence_of(:description) }
      end
      context 'uniqueness' do
        it { is_expected.to validate_uniqueness_of(:name) }
      end
    end
  end
end
