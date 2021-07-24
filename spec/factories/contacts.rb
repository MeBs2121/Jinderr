FactoryBot.define do
  factory :contact do
    account { nil }
    subject { "MyString" }
    content { "MyText" }
  end
end
