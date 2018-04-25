require 'spec_helper'

module Refinery
  module Notifications
    describe Notification do
      describe "validations" do
        subject do
          FactoryGirl.create(:notification,
          :notification_type => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:notification_type) { should == "Refinery CMS" }
      end
    end
  end
end
