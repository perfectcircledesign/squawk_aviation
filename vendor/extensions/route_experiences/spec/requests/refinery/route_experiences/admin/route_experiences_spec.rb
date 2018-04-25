# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "RouteExperiences" do
    describe "Admin" do
      describe "route_experiences" do
        login_refinery_user

        describe "route_experiences list" do
          before(:each) do
            FactoryGirl.create(:route_experience, :continent => "UniqueTitleOne")
            FactoryGirl.create(:route_experience, :continent => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.route_experiences_admin_route_experiences_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.route_experiences_admin_route_experiences_path

            click_link "Add New Route Experience"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Continent", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::RouteExperiences::RouteExperience.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Continent can't be blank")
              Refinery::RouteExperiences::RouteExperience.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:route_experience, :continent => "UniqueTitle") }

            it "should fail" do
              visit refinery.route_experiences_admin_route_experiences_path

              click_link "Add New Route Experience"

              fill_in "Continent", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::RouteExperiences::RouteExperience.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:route_experience, :continent => "A continent") }

          it "should succeed" do
            visit refinery.route_experiences_admin_route_experiences_path

            within ".actions" do
              click_link "Edit this route experience"
            end

            fill_in "Continent", :with => "A different continent"
            click_button "Save"

            page.should have_content("'A different continent' was successfully updated.")
            page.should have_no_content("A continent")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:route_experience, :continent => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.route_experiences_admin_route_experiences_path

            click_link "Remove this route experience forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::RouteExperiences::RouteExperience.count.should == 0
          end
        end

      end
    end
  end
end
