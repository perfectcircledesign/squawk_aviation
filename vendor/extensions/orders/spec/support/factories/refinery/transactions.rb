
FactoryGirl.define do
  factory :transaction, :class => Refinery::Transactions::Transaction do
    sequence(:unique_guid) { |n| "refinery#{n}" }
  end
end

