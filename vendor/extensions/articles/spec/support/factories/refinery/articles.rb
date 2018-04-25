
FactoryGirl.define do
  factory :article, :class => Refinery::Articles::Article do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

