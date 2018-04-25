
FactoryGirl.define do
  factory :customer, :class => Refinery::Customers::Customer do
    sequence(:first_name) { |n| "refinery#{n}" }
  end
end

