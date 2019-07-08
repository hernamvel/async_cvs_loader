require 'rails_helper'

RSpec.describe Identifier, type: :model do

  it 'has a valid factory' do
    expect(create(:identifier)).to be_valid
  end

  describe 'a valid user' do
    let(:identifier) { create(:identifier) }

    it 'is validated properly' do
      expect(identifier).to be_valid
    end
  end

  describe 'an invalid identifier' do

    it 'has a null identifier' do
      indentifier = build(:identifier, :no_identifier)
      expect(indentifier).to_not be_valid
      expect(indentifier.errors.added?(:identifier, :blank)).to be_truthy
    end

    it 'has a non alnum identifier' do
      indentifier = build(:identifier, :no_identifier)
      expect(indentifier).to_not be_valid
      expect(indentifier.errors.added?(:identifier, :blank)).to be_truthy
    end

  end
end
