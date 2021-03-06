FactoryGirl.define do
  factory :user do
    username("FactoryGirl")
    phone(ENV["USER_PHONE"])
    password("1234")
    password_confirmation("1234")
  end

  factory :post do
    title("Test Post")
    body("Test Body")
  end

  factory :comment do
    content("Test Content")
  end
end
