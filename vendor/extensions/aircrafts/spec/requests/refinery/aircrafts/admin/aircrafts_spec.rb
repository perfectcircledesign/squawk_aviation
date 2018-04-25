# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Aircrafts" do
    describe "Admin" do
      describe "aircrafts" do
        login_refinery_user

        describe "aircrafts list" do
          before(:each) do
            FactoryGirl.create(:aircraft, :name => "UniqueTitleOne")
            FactoryGirl.create(:aircraft, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.aircrafts_admin_aircrafts_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.aircrafts_admin_aircrafts_path

            click_link "Add New Aircraft"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Aircrafts::Aircraft.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Aircrafts::Aircraft.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:aircraft, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.aircrafts_admin_aircrafts_path

              click_link "Add New Aircraft"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Aircrafts::Aircraft.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:aircraft, :name => "A name") }

          it "should succeed" do
            visit refinery.aircrafts_admin_aircrafts_path

            within ".actions" do
              click_link "Edit this aircraft"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:aircraft, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.aircrafts_admin_aircrafts_path

            click_link "Remove this aircraft forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Aircrafts::Aircraft.count.should == 0
          end
        end

      end
    end
  end
end
