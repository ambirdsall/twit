FacotryGirl.define do
  factory :tweet do
    user
    text { Faker::Lorem.sentence }
  end
end
