FactoryGirl.define do
  factory :tournament do
    name "Test Skins"
    year 2016
    end_date Time.now + 1
    num_players 120
    num_rounds 1
  end

end
