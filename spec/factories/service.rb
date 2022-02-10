FactoryBot.define do
  factory :service do
    name { Faker::IndustrySegments.industry }
    description { Faker::Lorem.paragraph }
    website { Faker::Internet.url }
    locale { %i[en el].sample }
    slug { Faker::Internet.slug }

    trait(:multilingual) do
      after(:create) do |service|
        locale = (%i[en el] - [service.locale.to_sym]).first.to_s

        new_service = service.dup
        new_service.name << locale
        new_service.locale = locale
        new_service.save

        service.name << service.locale
        service.save
      end
    end
  end
end
