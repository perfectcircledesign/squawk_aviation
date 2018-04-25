require 'spec_helper'

module Refinery
  module Invoices
    describe Invoice do
      describe "validations" do
        subject do
          FactoryGirl.create(:invoice,
          :invoice_number => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:invoice_number) { should == "Refinery CMS" }
      end
    end
  end
end
