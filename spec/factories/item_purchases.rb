FactoryBot.define do
  factory :item_purchase do

    user_id { 6 }
    item_id { 29 }
    token { 'aaaaaaaaaaaaaaaaaaaaaa' }
    post_code { '105-0011' }
    prefecture_id { 3 }
    city { '東京都' }
    house_number { '港区' }
    building_name { '東京ハイツ' }
    tell      { '09000000000' }

  end
end
