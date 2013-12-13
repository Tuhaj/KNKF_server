FactoryGirl.define do
    factory :user do
  	email "zrazic@wp.pl"
  	full_name "Piotr Zientara"
  	password "secretly_created"
  	knkf_member true
  end

    factory :user_guest do
  	email "Eustachy@tester.pl"
  	full_name "Eustachy Rokita"
  	password "secretly_created"
  	knkf_member false
  end

end