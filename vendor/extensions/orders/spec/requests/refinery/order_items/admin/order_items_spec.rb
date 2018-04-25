# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "OrderItems" do
    describe "Admin" do
      describe "order_items" do
        login_refinery_user

        describe "order_items list" do
          before(:each) do
            FactoryGirl.create(:order_item, :product_name => "UniqueTitleOne")
            FactoryGirl.create(:order_item, :product_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.order_items_admin_order_items_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.order_items_admin_order_items_path

            click_link "Add New Order Item"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Product Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::OrderItems::OrderItem.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Product Name can't be blank")
              Refinery::OrderItems::OrderItem.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:order_item, :product_name => "UniqueTitle") }

            it "should fail" do
              visit refinery.order_items_admin_order_items_path

              click_link "Add New Order Item"

              fill_in "Product Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::OrderItems::OrderItem.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:order_item, :product_name => "A product_name") }

          it "should succeed" do
            visit refinery.order_items_admin_order_items_path

            within ".actions" do
              click_link "Edit this order item"
            end

            fill_in "Product Name", :with => "A different product_name"
            click_button "Save"

            page.should have_content("'A different product_name' was successfully updated.")
            page.should have_no_content("A product_name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:order_item, :product_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.order_items_admin_order_items_path

            click_link "Remove this order item forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::OrderItems::OrderItem.count.should == 0
          end
        end

      end
    end
  end
end
