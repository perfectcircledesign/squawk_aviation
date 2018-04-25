# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Messages" do
    describe "Admin" do
      describe "messages" do
        login_refinery_user

        describe "messages list" do
          before(:each) do
            FactoryGirl.create(:message, :sender => "UniqueTitleOne")
            FactoryGirl.create(:message, :sender => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.messages_admin_messages_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.messages_admin_messages_path

            click_link "Add New Message"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Sender", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Messages::Message.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Sender can't be blank")
              Refinery::Messages::Message.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:message, :sender => "UniqueTitle") }

            it "should fail" do
              visit refinery.messages_admin_messages_path

              click_link "Add New Message"

              fill_in "Sender", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Messages::Message.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:message, :sender => "A sender") }

          it "should succeed" do
            visit refinery.messages_admin_messages_path

            within ".actions" do
              click_link "Edit this message"
            end

            fill_in "Sender", :with => "A different sender"
            click_button "Save"

            page.should have_content("'A different sender' was successfully updated.")
            page.should have_no_content("A sender")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:message, :sender => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.messages_admin_messages_path

            click_link "Remove this message forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Messages::Message.count.should == 0
          end
        end

      end
    end
  end
end
