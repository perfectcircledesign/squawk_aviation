
FactoryGirl.define do
  factory :route_experience, :class => Refinery::RouteExperiences::RouteExperience do
    sequence(:continent) { |n| "refinery#{n}" }
  end
end

