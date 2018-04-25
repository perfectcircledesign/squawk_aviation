require 'spec_helper'

module Refinery
  module Transactions
    describe Transaction do
      describe "validations" do
        subject do
          FactoryGirl.create(:transaction,
          :unique_guid => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:unique_guid) { should == "Refinery CMS" }
      end
    end
  end
end
