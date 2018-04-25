require 'spec_helper'

module Refinery
  module Subscriptions
    describe Subscription do
      describe "validations" do
        subject do
          FactoryGirl.create(:subscription,
          :plan_name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:plan_name) { should == "Refinery CMS" }
      end
    end
  end
end
