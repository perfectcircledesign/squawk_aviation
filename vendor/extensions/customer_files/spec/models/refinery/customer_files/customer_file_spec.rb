require 'spec_helper'

module Refinery
  module CustomerFiles
    describe CustomerFile do
      describe "validations" do
        subject do
          FactoryGirl.create(:customer_file,
          :file_mime_type => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:file_mime_type) { should == "Refinery CMS" }
      end
    end
  end
end
