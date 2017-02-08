FactoryGirl.define do
  factory :invitation do
    email "MyString"
    tournament_id 1
    token "MyString"
    first_name "MyString"
    last_name "MyString"
    accepted false
    role "MyString"
  end
end
