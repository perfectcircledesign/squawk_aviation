
FactoryGirl.define do
  factory :notification, :class => Refinery::Notifications::Notification do
    sequence(:notification_type) { |n| "refinery#{n}" }
  end
end

