# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Customers" do
    describe "Admin" do
      describe "customers" do
        login_refinery_user

        describe "customers list" do
          before(:each) do
            FactoryGirl.create(:customer, :first_name => "UniqueTitleOne")
            FactoryGirl.create(:customer, :first_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.customers_admin_customers_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.customers_admin_customers_path

            click_link "Add New Customer"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "First Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Customers::Customer.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("First Name can't be blank")
              Refinery::Customers::Customer.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:customer, :first_name => "UniqueTitle") }

            it "should fail" do
              visit refinery.customers_admin_customers_path

              click_link "Add New Customer"

              fill_in "First Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Customers::Customer.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:customer, :first_name => "A first_name") }

          it "should succeed" do
            visit refinery.customers_admin_customers_path

            within ".actions" do
              click_link "Edit this customer"
            end

            fill_in "First Name", :with => "A different first_name"
            click_button "Save"

            page.should have_content("'A different first_name' was successfully updated.")
            page.should have_no_content("A first_name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:customer, :first_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.customers_admin_customers_path

            click_link "Remove this customer forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Customers::Customer.count.should == 0
          end
        end

      end
    end
  end
end
