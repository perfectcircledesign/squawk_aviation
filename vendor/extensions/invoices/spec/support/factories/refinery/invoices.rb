
FactoryGirl.define do
  factory :invoice, :class => Refinery::Invoices::Invoice do
    sequence(:invoice_number) { |n| "refinery#{n}" }
  end
end

