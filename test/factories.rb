FactoryGirl.define do
  factory :meeting do
    name "Meeting"
  end

  factory :user do
    sequence(:full_name) {|n| "Student#{n}" }
    email "not_a_real_email@not_a_real_server.pl"
    degree "none"
  end
end
