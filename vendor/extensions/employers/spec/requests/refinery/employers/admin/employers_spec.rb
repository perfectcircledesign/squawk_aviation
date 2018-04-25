# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Employers" do
    describe "Admin" do
      describe "employers" do
        login_refinery_user

        describe "employers list" do
          before(:each) do
            FactoryGirl.create(:employer, :name => "UniqueTitleOne")
            FactoryGirl.create(:employer, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.employers_admin_employers_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.employers_admin_employers_path

            click_link "Add New Employer"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Employers::Employer.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Employers::Employer.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:employer, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.employers_admin_employers_path

              click_link "Add New Employer"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Employers::Employer.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:employer, :name => "A name") }

          it "should succeed" do
            visit refinery.employers_admin_employers_path

            within ".actions" do
              click_link "Edit this employer"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:employer, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.employers_admin_employers_path

            click_link "Remove this employer forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Employers::Employer.count.should == 0
          end
        end

      end
    end
  end
end
