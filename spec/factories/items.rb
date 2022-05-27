FactoryBot.define do
  factory :item do
    item_name             {"hoge"}
    introduction             {Faker::Lorem.sentence}
    category_id     {2}
    postage_memu_id  {2}
    sipping_area_id          {13}
    preparation_day_id {2}
    price            {"9999"}
    item_condition_id     {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end 

  end
end   
   