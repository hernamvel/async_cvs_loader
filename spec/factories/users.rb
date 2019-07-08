FactoryBot.define do
  factory :user do
    # Cant trust FFaker::Name will generate names with only alphas
    first {"Hernan"}
    last {"Velasquez"}
    phone {FFaker::PhoneNumber.short_phone_number}
    email {FFaker::Internet.email}
    identifier

    trait :no_ten_digits_phone do
      phone {"123122"}
    end

    trait :invalid_format do
      phone {"123ffe13"}
    end

    trait :invalid_first_digit do
      phone {"0232123212"}
    end

    trait :invalid_third_digit do
      phone {"5230123212"}
    end

    trait :another_invalid_phone do
      phone {"954-#330-5181"}
    end

    trait :invalid_email do
      email {"invalid_email"}
    end

    trait :invalid_first_length do
      first {'d'}
    end

    trait :invalid_last_length do
      last {'a'}
    end

    trait :invalid_first_char do
      first {'hernan1'}
    end

    trait :invalid_last_char do
      last {'v3lasqu3z'}
    end

    trait :last_with_no_first do
      first { '' }
    end


  end
end
