FactoryBot.define do
  factory :identifier do
    identifier {FFaker::Code.ean}

    trait :no_identifier do
      identifier {nil}
    end

  end
end
