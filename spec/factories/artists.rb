FactoryGirl.define do
  factory :artist do
    name          { Faker::Name.name }
    image         { Faker::Internet.url }
    spotify_url   { Faker::Code.asin }
  end
end