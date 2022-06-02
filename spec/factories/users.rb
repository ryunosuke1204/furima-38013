FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email     {Faker::Internet.free_email}
    password              { '000aaa' }
    password_confirmation { '000aaa' }
    first_name            { '山田' }
    last_name             { '山田' }
    first_name_kana         { 'ヤマダ' }
    last_name_kana          { 'ヤマダ' }
    birth_day { '1999/12/12' }
  end
end
