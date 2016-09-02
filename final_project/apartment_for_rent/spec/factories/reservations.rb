FactoryGirl.define do
  factory :reservation do
    price 1
    checkin_date "2016-03-28"
    checkout_date "2016-03-28"
    user nil
    apartment_listing nil
  end
end
