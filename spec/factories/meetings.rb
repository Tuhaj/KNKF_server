FactoryGirl.define do
  factory :meeting do
    name "Heidegger 2014"
    date Date.parse("2014-01-01")
    description "znów czytamy Heideggera"
  end
end