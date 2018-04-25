require 'spec_helper'

module Refinery
  module Messages
    describe Message do
      describe "validations" do
        subject do
          FactoryGirl.create(:message,
          :sender => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:sender) { should == "Refinery CMS" }
      end
    end
  end
end
