FactoryGirl.define do
  factory :user do
    username("Test")
    password("1234")
    password_confirmation("1234")
  end
end
