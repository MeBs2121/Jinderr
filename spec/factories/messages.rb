FactoryBot.define do
  factory :message do
    content { "Hey hey" }

    account
    room
  end
end
