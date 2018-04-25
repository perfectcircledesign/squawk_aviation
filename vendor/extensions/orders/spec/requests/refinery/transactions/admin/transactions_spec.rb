# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Transactions" do
    describe "Admin" do
      describe "transactions" do
        login_refinery_user

        describe "transactions list" do
          before(:each) do
            FactoryGirl.create(:transaction, :unique_guid => "UniqueTitleOne")
            FactoryGirl.create(:transaction, :unique_guid => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.transactions_admin_transactions_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.transactions_admin_transactions_path

            click_link "Add New Transaction"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Unique Guid", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Transactions::Transaction.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Unique Guid can't be blank")
              Refinery::Transactions::Transaction.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:transaction, :unique_guid => "UniqueTitle") }

            it "should fail" do
              visit refinery.transactions_admin_transactions_path

              click_link "Add New Transaction"

              fill_in "Unique Guid", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Transactions::Transaction.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:transaction, :unique_guid => "A unique_guid") }

          it "should succeed" do
            visit refinery.transactions_admin_transactions_path

            within ".actions" do
              click_link "Edit this transaction"
            end

            fill_in "Unique Guid", :with => "A different unique_guid"
            click_button "Save"

            page.should have_content("'A different unique_guid' was successfully updated.")
            page.should have_no_content("A unique_guid")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:transaction, :unique_guid => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.transactions_admin_transactions_path

            click_link "Remove this transaction forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Transactions::Transaction.count.should == 0
          end
        end

      end
    end
  end
end
