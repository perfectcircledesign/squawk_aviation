
FactoryGirl.define do
  factory :customer_file, :class => Refinery::CustomerFiles::CustomerFile do
    sequence(:file_mime_type) { |n| "refinery#{n}" }
  end
end

