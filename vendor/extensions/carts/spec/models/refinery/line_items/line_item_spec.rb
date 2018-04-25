require 'spec_helper'

module Refinery
  module LineItems
    describe LineItem do
      describe "validations" do
        subject do
          FactoryGirl.create(:line_item)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
