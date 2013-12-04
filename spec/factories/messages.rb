# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    title "tytuł wiadomości"
    membership false
    content "Wiadomość"
  end
end
