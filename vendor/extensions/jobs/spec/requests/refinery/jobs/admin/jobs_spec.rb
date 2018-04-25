# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Jobs" do
    describe "Admin" do
      describe "jobs" do
        login_refinery_user

        describe "jobs list" do
          before(:each) do
            FactoryGirl.create(:job, :name => "UniqueTitleOne")
            FactoryGirl.create(:job, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.jobs_admin_jobs_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.jobs_admin_jobs_path

            click_link "Add New Job"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Jobs::Job.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Jobs::Job.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:job, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.jobs_admin_jobs_path

              click_link "Add New Job"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Jobs::Job.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:job, :name => "A name") }

          it "should succeed" do
            visit refinery.jobs_admin_jobs_path

            within ".actions" do
              click_link "Edit this job"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:job, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.jobs_admin_jobs_path

            click_link "Remove this job forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Jobs::Job.count.should == 0
          end
        end

      end
    end
  end
end
