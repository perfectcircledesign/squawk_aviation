module Refinery
  module Notifications
    class Notification < Refinery::Core::BaseModel
      self.table_name = 'refinery_notifications'      
    
      acts_as_indexed :fields => [:notification_type, :url, :receiver_class, :sender_class]


      AIRLINE_JOB = 'AirlineJob'
      AIRLINE_LIKE = 'AirlineLike'
      AIRLINE_VIEW = 'AirlineView'
      AIRLINE_MSG = 'AirlineMsg'
      PILOT_JOB = 'PilotJob'
      PILOT_MSG = 'PilotMsg'

      attr_accessible :notification_type, :url, :receiver_id, :receiver_class, :sender_id, :sender_class, :seen, :position

      def sender
        (eval self.sender_class).find(self.sender_id)
      end

      def receiver
        (eval self.receiver_class).find(self.receiver_id)
      end

      def seen!
        self.update_attribute(:seen, true)
      end

      def self.valid?(notification_type, sender_id, sender_class, receiver_id, receiver_class)
        Notification.where("notification_type = ? AND sender_id = ? AND sender_class = ? AND receiver_id = ? AND receiver_class = ?", notification_type ,sender_id ,sender_class ,receiver_id ,receiver_class).blank?
      end

      def message
        if self.notification_type == AIRLINE_MSG
          self.sender.name + " " + AIRLINE_MSG
        elsif self.notification_type == AIRLINE_JOB
          self.sender.name + " " + "posted a new job"
        elsif self.notification_type == AIRLINE_LIKE
          self.sender.name + " " + "favourited you"
        elsif self.notification_type == AIRLINE_VIEW
          self.sender.name + " " + "viewed your profile"
        elsif self.notification_type == AIRLINE_MSG
          self.sender.name + " " + "sent you a new message"
        elsif self.notification_type == PILOT_JOB
          self.sender.name + " " + "is interested a job"
        elsif self.notification_type == PILOT_MSG
          self.sender.name + " " + "sent you a new message"
        end
      end

      def app_path
        if self.notification_type == AIRLINE_MSG
          'app.messengerindex'
        elsif self.notification_type == AIRLINE_JOB
          'app.jobsshow'
        elsif self.notification_type == AIRLINE_LIKE
          'app.airlineshow'
        elsif self.notification_type == AIRLINE_VIEW
          'app.airlineshow'
        elsif self.notification_type == AIRLINE_MSG
          'app.messengerindex'
        elsif self.notification_type == PILOT_JOB
          'app.jobsshow'
        elsif self.notification_type == PILOT_MSG
          'app.messengerindex'
        end
      end

      def object
        if self.notification_type == AIRLINE_MSG
          ''
        elsif self.notification_type == AIRLINE_JOB
          self.sender.jobs.last.id
        elsif self.notification_type == AIRLINE_LIKE
          self.sender.id
        elsif self.notification_type == AIRLINE_VIEW
          self.sender.id
        elsif self.notification_type == AIRLINE_MSG
          ''
        elsif self.notification_type == PILOT_JOB
          'app.jobsshow'
        elsif self.notification_type == PILOT_MSG
          ''
        end
      end
    
             
    end
  end
end
