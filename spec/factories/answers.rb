# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    question_id ""
    user_id ""
    answer "MyText"
    chosen_answer false
  end
end
