FactoryGirl.define do
  factory :user do
   email { Faker::Internet.email }
   first_name { Faker::Name.first_name }
   last_name { Faker::Name.last_name }
   home { "#{Faker::Address.city}, #{Faker::Address.state_abbr}" }
   password "password"
   password_confirmation "password"
   handicap {rand(2..32).to_f}
  end

end
