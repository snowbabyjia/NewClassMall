# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    title "MyString"
    starting "2013-04-10"
    ending "2013-04-10"
    description "MyText"
  end
end
