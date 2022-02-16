FactoryBot.define do
  factory :topic do
    name { Faker::IndustrySegments.industry }
    description { Faker::Lorem.paragraph }
    locale { %i[en el].sample }

    trait :with_subtopic do
      association :topic, name: "subtopic of #{name}"
    end
  end
end
