
FactoryGirl.define do
  factory :language, :class => Refinery::Languages::Language do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

