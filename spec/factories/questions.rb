# spec/factories/questions.rb
FactoryBot.define do
  factory :question do
    sequence(:id) { |n| n }
    sequence(:title) { |n| "Question_#{n}" }
    body {Faker::Markdown.ordered_list}
    user_id 1
  end
end
