
FactoryGirl.define do
  factory :message, :class => Refinery::Messages::Message do
    sequence(:sender) { |n| "refinery#{n}" }
  end
end

