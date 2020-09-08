FactoryBot.define do
  factory :item do
    association :user
    name                  {Faker::Name.initials(number: 5)}
    image_text            {"とてもかっこいいです"}
    price                 {10_000}
    category_id           {2}
    condition_id          {2}
    postage_id            {2}
    handling_id           {2}
    prefecture_id         {2}
  end
end