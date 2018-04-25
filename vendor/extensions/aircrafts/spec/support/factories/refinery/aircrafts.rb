
FactoryGirl.define do
  factory :aircraft, :class => Refinery::Aircrafts::Aircraft do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

