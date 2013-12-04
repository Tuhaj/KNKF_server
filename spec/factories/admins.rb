# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin do
  	email "zrazic@wp.pl"
  	password "secretly_created"
  end
end
