FactoryGirl.define do
  factory :user do
    name     "Marshall Schulte"
    email    "marshall@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end