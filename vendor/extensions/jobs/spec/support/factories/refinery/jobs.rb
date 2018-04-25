
FactoryGirl.define do
  factory :job, :class => Refinery::Jobs::Job do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

