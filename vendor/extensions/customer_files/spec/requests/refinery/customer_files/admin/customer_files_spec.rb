# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "CustomerFiles" do
    describe "Admin" do
      describe "customer_files" do
        login_refinery_user

        describe "customer_files list" do
          before(:each) do
            FactoryGirl.create(:customer_file, :file_mime_type => "UniqueTitleOne")
            FactoryGirl.create(:customer_file, :file_mime_type => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.customer_files_admin_customer_files_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.customer_files_admin_customer_files_path

            click_link "Add New Customer File"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "File Mime Type", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::CustomerFiles::CustomerFile.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("File Mime Type can't be blank")
              Refinery::CustomerFiles::CustomerFile.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:customer_file, :file_mime_type => "UniqueTitle") }

            it "should fail" do
              visit refinery.customer_files_admin_customer_files_path

              click_link "Add New Customer File"

              fill_in "File Mime Type", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::CustomerFiles::CustomerFile.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:customer_file, :file_mime_type => "A file_mime_type") }

          it "should succeed" do
            visit refinery.customer_files_admin_customer_files_path

            within ".actions" do
              click_link "Edit this customer file"
            end

            fill_in "File Mime Type", :with => "A different file_mime_type"
            click_button "Save"

            page.should have_content("'A different file_mime_type' was successfully updated.")
            page.should have_no_content("A file_mime_type")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:customer_file, :file_mime_type => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.customer_files_admin_customer_files_path

            click_link "Remove this customer file forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::CustomerFiles::CustomerFile.count.should == 0
          end
        end

      end
    end
  end
end
