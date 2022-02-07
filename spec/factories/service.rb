FactoryBot.define do
  factory :service do
    name { Faker::IndustrySegments.industry }
    description { Faker::Lorem.paragraph }
    website { Faker::Internet.url }
    locale { %i[en el].sample }
  end
end
