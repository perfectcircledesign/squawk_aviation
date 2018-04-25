
FactoryGirl.define do
  factory :order, :class => Refinery::Orders::Order do
    sequence(:order_number) { |n| "refinery#{n}" }
  end
end

