require 'spec_helper'

module Refinery
  module Carts
    describe Cart do
      describe "validations" do
        subject do
          FactoryGirl.create(:cart)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
