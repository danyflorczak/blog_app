FactoryBot.define do
  factory :comment do
    commenter { "MyString" }
    body { "MyText" }
    article { nil }
    status { "public" } 
  end
end