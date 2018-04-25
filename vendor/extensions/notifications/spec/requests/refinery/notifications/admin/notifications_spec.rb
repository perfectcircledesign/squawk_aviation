# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Notifications" do
    describe "Admin" do
      describe "notifications" do
        login_refinery_user

        describe "notifications list" do
          before(:each) do
            FactoryGirl.create(:notification, :notification_type => "UniqueTitleOne")
            FactoryGirl.create(:notification, :notification_type => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.notifications_admin_notifications_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.notifications_admin_notifications_path

            click_link "Add New Notification"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Notification Type", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Notifications::Notification.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Notification Type can't be blank")
              Refinery::Notifications::Notification.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:notification, :notification_type => "UniqueTitle") }

            it "should fail" do
              visit refinery.notifications_admin_notifications_path

              click_link "Add New Notification"

              fill_in "Notification Type", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Notifications::Notification.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:notification, :notification_type => "A notification_type") }

          it "should succeed" do
            visit refinery.notifications_admin_notifications_path

            within ".actions" do
              click_link "Edit this notification"
            end

            fill_in "Notification Type", :with => "A different notification_type"
            click_button "Save"

            page.should have_content("'A different notification_type' was successfully updated.")
            page.should have_no_content("A notification_type")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:notification, :notification_type => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.notifications_admin_notifications_path

            click_link "Remove this notification forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Notifications::Notification.count.should == 0
          end
        end

      end
    end
  end
end
