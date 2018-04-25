module Refinery
  module Airlines
    class Airline < Refinery::Core::BaseModel
      self.table_name = 'refinery_airlines'

      after_create :new_airline
      after_save :new_valid_airline, if: :valid_airline_changed?


      devise :database_authenticatable, :registerable,
             :recoverable, :rememberable, :trackable, :validatable
    
      acts_as_indexed :fields => [:name]

      attr_accessible :name, :contact_number, :email, :password, :password_confirmation, :remember_me, :position, :airline_name, :head_office_address, :logo_id,
                      :facebook, :twitter, :linkedin, :googleplus, :website, :description, :last_notification_id, :views_count, :valid_airline,
                      :company_size, :image1_id, :image2_id, :image3_id, :image4_id, :image5_id, :sliver_id, :blacklist_customer_ids, :image1_upload, :image2_upload, :image3_upload, :image4_upload, :image5_upload, :sliver_upload

      attr_accessor :notification_count, :unread_message_count

      attr_accessor :image1_upload, :image2_upload, :image3_upload, :image4_upload, :image5_upload, :sliver_upload

      validates :name, :presence => true

      def name
        airline_name
      end

      def contact_name
        self[:name]
      end

      def new_airline
        Notifier.new_airline(self).deliver
      end

      def new_valid_airline
        if self.valid_airline
          Notifier.new_valid_airline(self).deliver
        end
      end

      def likes_count
        Refinery::Customers::Customer.eager_load(:favourites).where('favourites.who_favourite = ? AND favourites.airline_id = ? AND favourites.customer_id = refinery_customers.id', 'pilot', self.id).count
      end

      scope :active, where(:valid_airline => true)
      scope :has_logo, where('logo_id is not null')

      belongs_to :logo, :class_name => "Refinery::Image"
      belongs_to :image1, :class_name => "Refinery::Image"
      belongs_to :image2, :class_name => "Refinery::Image"
      belongs_to :image3, :class_name => "Refinery::Image"
      belongs_to :image4, :class_name => "Refinery::Image"
      belongs_to :image5, :class_name => "Refinery::Image"
      belongs_to :sliver, :class_name => "Refinery::Image"
      has_many :favourites, :class_name => 'Favourite'
      has_many :blacklist_customers, :class_name => 'BlacklistCustomer'
      has_many :article_job_lookup, :class_name => 'ArticleJobLookup'

      has_and_belongs_to_many :blacklist_customers, :class_name => 'Refinery::Customers::Customer', :join_table => 'refinery_airlines_customers'

      has_many :jobs, :class_name => 'Refinery::Jobs::Job'
      has_many :articles, :class_name => 'Refinery::Articles::Article'
      has_many :messages, :class_name => '::Refinery::Messages::Message'

      def followers_count
         Refinery::Customers::Customer.eager_load(:favourites).where('favourites.who_favourite = ? AND favourites.airline_id = ? AND favourites.customer_id = refinery_customers.id', 'Airline', self.id).count
      end

      def image
        logo
      end

       def notifications
        Refinery::Notifications::Notification.where(:receiver_id => self.id, :receiver_class => self.class.name)
       end

       def active_jobs
         if self.jobs.present?
          self.jobs.is_active.count
         else
          0
         end
       end

      def notification_count!
        self.unread_message_count = Refinery::Messages::Message.where('airline_id = ? AND sender = ? AND seen = ?', self.id, 'user-message', false).count
        self.notification_count = Refinery::Notifications::Notification.where('receiver_id = ? AND receiver_class = ? AND id > ?', self.id, 'Refinery::Airlines::Airline', self.last_notification_id.present? ? self.last_notification_id : 0).count
      end
    end
  end
end
