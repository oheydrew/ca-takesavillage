FactoryBot.define do
  factory :event do
    owner_id nil
    title "MyString"
    description "MyText"
    requirements "MyText"
    image_data "MyText"
    price 1
    start_date "2018-05-06 18:52:31"
    start_time "2018-05-06 18:52:31"
    duration 1
    street "MyString"
    suburb "MyString"
    state "MyString"
    country_code "MyString"
  end
end
