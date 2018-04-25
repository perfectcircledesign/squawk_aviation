require 'spec_helper'

module Refinery
  module RouteExperiences
    describe RouteExperience do
      describe "validations" do
        subject do
          FactoryGirl.create(:route_experience,
          :continent => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:continent) { should == "Refinery CMS" }
      end
    end
  end
end
