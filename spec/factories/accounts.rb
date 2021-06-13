FactoryBot.define do
  factory :account do
    sequence(:email) { |n| "test#{n}@test.com" }
    nickname { "testuser" }
    firstname { "test" }
    lastname { "user" }
    details { "Hi Im a test user. Please follow me!" }
    photo { nil }
    # supporting_id { supporting }
    # gender_id { gender }
    password { "password" }

    gender
    supporting

    after(:create) do |account|
      create(:interested_in_gender, account: account, gender: create(:gender, name: "male"))
    end
  end
end
