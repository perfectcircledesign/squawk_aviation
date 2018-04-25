
FactoryGirl.define do
  factory :employer, :class => Refinery::Employers::Employer do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

