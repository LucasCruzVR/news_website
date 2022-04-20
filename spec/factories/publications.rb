FactoryBot.define do
  factory :publication do
    title { Faker::Movie.title }
    subtitle { Faker::Movie.quote }
    content { Faker::Lorem.paragraph }
  end
end
