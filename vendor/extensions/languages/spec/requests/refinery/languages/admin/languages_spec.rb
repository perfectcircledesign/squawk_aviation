# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Languages" do
    describe "Admin" do
      describe "languages" do
        login_refinery_user

        describe "languages list" do
          before(:each) do
            FactoryGirl.create(:language, :name => "UniqueTitleOne")
            FactoryGirl.create(:language, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.languages_admin_languages_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.languages_admin_languages_path

            click_link "Add New Language"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Languages::Language.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Languages::Language.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:language, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.languages_admin_languages_path

              click_link "Add New Language"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Languages::Language.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:language, :name => "A name") }

          it "should succeed" do
            visit refinery.languages_admin_languages_path

            within ".actions" do
              click_link "Edit this language"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:language, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.languages_admin_languages_path

            click_link "Remove this language forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Languages::Language.count.should == 0
          end
        end

      end
    end
  end
end
