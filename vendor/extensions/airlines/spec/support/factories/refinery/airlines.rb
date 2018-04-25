
FactoryGirl.define do
  factory :airline, :class => Refinery::Airlines::Airline do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

