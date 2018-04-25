require 'spec_helper'

module Refinery
  module OrderItems
    describe OrderItem do
      describe "validations" do
        subject do
          FactoryGirl.create(:order_item,
          :product_name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:product_name) { should == "Refinery CMS" }
      end
    end
  end
end
