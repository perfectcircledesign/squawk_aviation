
FactoryGirl.define do
  factory :subscription, :class => Refinery::Subscriptions::Subscription do
    sequence(:plan_name) { |n| "refinery#{n}" }
  end
end

