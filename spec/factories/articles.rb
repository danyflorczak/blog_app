FactoryBot.define do
  factory :article do
    title { Faker::Name}
    body { Faker::Name }
  end
end
