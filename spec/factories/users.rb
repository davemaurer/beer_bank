FactoryGirl.define do
  factory :user do
    name "john"
    uid "5000"
    oauth_token "token"
    oauth_token_secret "secret"
  end
end
