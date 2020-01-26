FactoryGirl.define do
  factory :artist do
    name          { Faker::Name.name }
    image         { Faker::Internet.url }
    popularity    { Faker::Number.number }
    spotify_url   { Faker::Code.asin }
  end
end