FactoryBot.define do
  factory :account do
    email { "test@test.com" }
    nickname { "testuser" }
    firstname { "test" }
    lastname { "user" }
    details { "Hi Im a test user. Please follow me!" }
    photo { nil }
    supporting_id { supporting }
    gender_id { gender }
    password { "password" }

    association :gender
    association :supporting
  end
end
