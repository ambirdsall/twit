FactoryGirl.define do
  sequence :email do |n|
    "person_#{n}@example.com"
  end

  factory :user do
    email
    password "123"
  end
end
