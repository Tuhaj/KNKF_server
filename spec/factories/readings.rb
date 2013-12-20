FactoryGirl.define do
  factory :reading do
    sequence(:title) { |n| "Wiedza cz. #{n}" }
    author "Martin Heidegger"
  end
end