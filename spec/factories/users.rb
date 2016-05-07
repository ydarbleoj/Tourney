FactoryGirl.define do
  factory :user do
   sequence(:email) {|n| "user#{n}@mail.com"}
   sequence(:username) {|n| "username#{n}"}
   password "password"
   password_confirmation "password"
   handicap {rand(2..32)}
  end

end
