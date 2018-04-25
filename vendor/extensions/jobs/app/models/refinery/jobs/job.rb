module Refinery
  module Jobs
    class Job < Refinery::Core::BaseModel
      self.table_name = 'refinery_jobs'

      after_create :create_lookup_record
    
      acts_as_indexed :fields => [:name, :description]

      CONTRACTS = ["Agency Contract", "Fixed term contract", "Apprenticeship / Cadetship", "Permanent Contract"]

      attr_accessible :name, :description, :position, :contract_type, :airline_id, :benefits, :requirements, :active, :location, :salary, :published_date, :expiry_date, :career_path

      validates :name, :presence => true, :uniqueness => true

      has_many :favourites, :class_name => 'Favourite'
      belongs_to :airline, :class_name => 'Refinery::Airlines::Airline'
      has_one :article_job_lookup, :class_name => 'ArticleJobLookup'

      after_create :send_notification

      def create_lookup_record
        ArticleJobLookup.create(:job_id => self.id, :airline_id => self.airline_id)
      end

      scope :is_active, where('active = ? AND published_date <= ? AND expiry_date >= ?', true, DateTime.now, DateTime.now)

      def live?
        if self.published_date.present? and self.active.present? and self.expiry_date.present?
          true if self.active == true and self.published_date <= DateTime.now and self.expiry_date >= DateTime.now
        else
          false
        end
      end

      def is_active?
        if self.published_date.present? and self.active.present? and self.expiry_date.present?
          true if self.active == true and self.published_date <= DateTime.now and self.expiry_date >= DateTime.now
        else
          false
        end
      end

      def send_notification
        favourite_customers = Refinery::Customers::Customer.eager_load(:favourites).where('favourites.who_favourite = ? AND favourites.airline_id = ? AND favourites.customer_id = refinery_customers.id', 'pilot', self.airline.id)
          favourite_customers.each do |customer|
            #if Refinery::Notifications::Notification.valid?(Refinery::Notifications::Notification::AIRLINE_JOB, self.airline.id, self.airline.class.name, customer.id, customer.class.name)
              Refinery::Notifications::Notification.create(notification_type: Refinery::Notifications::Notification::AIRLINE_JOB, url: "/jobs/#{self.id}", sender_id: self.airline.id, sender_class: self.airline.class.name, receiver_id: customer.id, receiver_class:  customer.class.name)
            #end
          end
      end

    end
  end
end
