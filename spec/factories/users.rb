# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    id 1
    provider 'google'
    uid '12345678910'
    name 'Han Solo'
    email 'han.solo@millenniumfalcon.com'
    first_name 'Han'
    last_name 'Solo'
    token 'abcdefg12345'
    refresh_token '12345abcdefg'
    expires_at DateTime.now
  end
end