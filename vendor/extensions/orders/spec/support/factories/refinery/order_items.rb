
FactoryGirl.define do
  factory :order_item, :class => Refinery::OrderItems::OrderItem do
    sequence(:product_name) { |n| "refinery#{n}" }
  end
end

