# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Invoices" do
    describe "Admin" do
      describe "invoices" do
        login_refinery_user

        describe "invoices list" do
          before(:each) do
            FactoryGirl.create(:invoice, :invoice_number => "UniqueTitleOne")
            FactoryGirl.create(:invoice, :invoice_number => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.invoices_admin_invoices_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.invoices_admin_invoices_path

            click_link "Add New Invoice"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Invoice Number", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Invoices::Invoice.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Invoice Number can't be blank")
              Refinery::Invoices::Invoice.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:invoice, :invoice_number => "UniqueTitle") }

            it "should fail" do
              visit refinery.invoices_admin_invoices_path

              click_link "Add New Invoice"

              fill_in "Invoice Number", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Invoices::Invoice.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:invoice, :invoice_number => "A invoice_number") }

          it "should succeed" do
            visit refinery.invoices_admin_invoices_path

            within ".actions" do
              click_link "Edit this invoice"
            end

            fill_in "Invoice Number", :with => "A different invoice_number"
            click_button "Save"

            page.should have_content("'A different invoice_number' was successfully updated.")
            page.should have_no_content("A invoice_number")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:invoice, :invoice_number => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.invoices_admin_invoices_path

            click_link "Remove this invoice forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Invoices::Invoice.count.should == 0
          end
        end

      end
    end
  end
end
