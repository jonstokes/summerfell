FactoryGirl.define do
  factory :user do
    email { Forgery(:internet).email_address }
    password { SecureRandom.uuid }
    role { :user }
  end

end
