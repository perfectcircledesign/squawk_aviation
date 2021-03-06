require 'spec_helper'

module Refinery
  module Faqs
    describe Faq do
      describe "validations" do
        subject do
          FactoryGirl.create(:faq)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
