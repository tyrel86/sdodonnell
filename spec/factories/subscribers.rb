# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscriber do
    name "MyString"
    email "MyString"
    confirmed false
  end
end
