# key thing to remember is that factories should always provide a set of valid attributes
# which means the factoires should always create record with no validation errors
FactoryGirl.define do
  factory :campaign do
    association :user, factory: :user
    # put values you want to assign as a variable,
    # then put values you want the factory to assign to that attr
    # if yu give value without a block, it's going to be the same for all
    # with block, faker will try to generate different values everytime
    # to be 100% sure, use 'sequence'
    sequence(:name)        {|n| "#{Faker::Company.bs}-#{n}"}
    sequence(:description) {|n| "#{Faker::Lorem.paragraph}-#{n}"}
    goal        100000
    end_date    60.days.from_now
  end
end
