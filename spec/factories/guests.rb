FactoryGirl.define do
  factory :guest do
    package
    device_address { Forgery(:internet).mac_address }
    access_point_address { Forgery(:internet).mac_address }
    email { Forgery(:internet).email_address }
  end
end
