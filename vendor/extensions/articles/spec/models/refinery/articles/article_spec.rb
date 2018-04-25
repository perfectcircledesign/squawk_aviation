require 'spec_helper'

module Refinery
  module Articles
    describe Article do
      describe "validations" do
        subject do
          FactoryGirl.create(:article,
          :name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name) { should == "Refinery CMS" }
      end
    end
  end
end
