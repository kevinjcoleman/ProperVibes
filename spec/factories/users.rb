FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "johndoe#{n}@example.com"}
    password 'password'
  end
end