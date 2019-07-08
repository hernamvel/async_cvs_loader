class User < ApplicationRecord

  validate :email_format
  validate :phone_format
  validate :name_format
  validate :name_completeness

  belongs_to :identifier

  private

  def name_format
    if first
      if (first =~ /^[A-Za-z]+$/).nil?
        errors.add(:first, :only_alpha)
      end
      if first.length < 2
        errors.add(:first, :invalid_length)
      end
    end
    if last
      if (last =~ /^[A-Za-z]+$/).nil?
        errors.add(:last, :only_alpha)
      end
      if last.length < 2
        errors.add(:last, :invalid_length)
      end
    end
  end

  def name_completeness
    if first.blank? && last.present?
      errors.add(:last, :last_with_no_first)
    end
  end

  def email_format
    if email
      if (email =~ URI::MailTo::EMAIL_REGEXP).nil?
        errors.add(:email, :invalid)
      end
    end
  end

  def phone_format
    if phone
      if (phone =~ /^(\d|-|\.|,)+$/).nil?
        errors.add(:phone, :invalid_format)
      end
      phone_digits = phone.gsub(/[^0-9]/, '')
      if phone_digits.length != 10
        errors.add(:phone, :number_of_digits)
      end
      if phone_digits[0] == '0'
        errors.add(:phone, :invalid_first_digit)
      end
      if phone_digits[3] == '0'
        errors.add(:phone, :invalid_third_digit)
      end
    end
  end

end
