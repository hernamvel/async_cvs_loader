require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'a valid user' do
    let(:user) { create(:user) }

    it 'is validated properly' do
      expect(user).to be_valid
    end

  end

  describe 'an invalid user' do
    let(:user) { build(:user) }

    it 'has an invalid phone format' do
      user = build(:user, :invalid_format)
      expect(user).to_not be_valid
      expect(user.errors.added?(:phone, :invalid_format)).to be_truthy
    end

    it 'has an invalid phone with not 10 digits' do
      user = build(:user, :no_ten_digits_phone)
      expect(user).to_not be_valid
      expect(user.errors.added?(:phone, :number_of_digits)).to be_truthy
    end

    it 'has an invalid phone with special chars digits' do
      user = build(:user, :another_invalid_phone)
      expect(user).to_not be_valid
      expect(user.errors.added?(:phone, :invalid_format)).to be_truthy
    end

    it 'has an invalid phone on its first digit' do
      user = build(:user, :invalid_first_digit)
      expect(user).to_not be_valid
      expect(user.errors.added?(:phone, :invalid_first_digit)).to be_truthy
    end

    it 'has an invalid phone on its third digit' do
      user = build(:user, :invalid_third_digit)
      expect(user).to_not be_valid
      expect(user.errors.added?(:phone, :invalid_third_digit)).to be_truthy
    end

    it 'has an invalid email' do
      user = build(:user, :invalid_email)
      expect(user).to_not be_valid
      expect(user.errors.added?(:email, :invalid)).to be_truthy
    end

    it 'has an invalid first with only 1 char' do
      user = build(:user, :invalid_first_length)
      expect(user).to_not be_valid
      expect(user.errors.added?(:first, :invalid_length)).to be_truthy
    end

    it 'has an invalid first with a number character' do
      user = build(:user, :invalid_first_char)
      expect(user).to_not be_valid
      expect(user.errors.added?(:first, :only_alpha)).to be_truthy
    end

    it 'has an invalid last with only 1 char' do
      user = build(:user, :invalid_last_length)
      expect(user).to_not be_valid
      expect(user.errors.added?(:last, :invalid_length)).to be_truthy
    end

    it 'has an invalid last with a number character' do
      user = build(:user, :invalid_last_char)
      expect(user).to_not be_valid
      expect(user.errors.added?(:last, :only_alpha)).to be_truthy
    end

    it 'is invalid becuase last is present when first is not' do
      user = build(:user, :last_with_no_first)
      expect(user).to_not be_valid
      expect(user.errors.added?(:last, :last_with_no_first)).to be_truthy
    end
  end

end
