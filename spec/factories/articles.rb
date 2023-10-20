FactoryBot.define do
  factory :article do
    title { Faker::Name.title }
    body { Faker::Name.name }
  end
end
