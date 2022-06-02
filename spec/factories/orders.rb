FactoryBot.define do
  factory :order do
        user_id { Faker::Number.non_zero_digit }
        item_id { Faker::Number.non_zero_digit }
        post_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
        sipping_area_id { Faker::Number.between(from: 1, to: 47) }
        municipalities { Faker::Address.city }
        address { Faker::Address.street_address }
        building { Faker::Address.street_address }
        phone_number { Faker::Number.decimal_part(digits: 11) }
        token { Faker::Internet.password(min_length: 20, max_length: 30) }
      end
    end