module Refinery
  module Customers
    class Customer < Refinery::Core::BaseModel
      self.table_name = 'refinery_customers'

      # Include default devise modules. Others available are:
      # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
      devise :database_authenticatable, :registerable,
             :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :linkedin]

      # has_many :customer_files, :class_name => '::Refinery::CustomerFiles::CustomerFile'

      GENDERS = %w(Male Female)
      CAREERS = %w(Pilot Cabin\ Crew Aircraft\ Maintenance Other)
      MARITALSTATUS = %w(Single Married Widowed Separated\ /\ Divorced)
      # NOTICEPERIOD = %w(7\ Days 15\ Days 30\ Days Other)
      # %w(Level\ 1\ –\ Pre-elementary Level\ 2\ –\ Elementary Level\ 3\ –\ Pre-operational Level\ 4\ –\ Operational Level\ 5\ –\ Extended Level\ 6\ –\ Expert)
      ICAO = ["Level 1 - Pre-elementary","Level 2 - Elementary","Level 3 - Pre-operational","Level 4 - Operational","Level 5 - Extended","Level 6 - Expert"]

      has_many :carts, :class_name => '::Refinery::Carts::Cart'
      has_many :orders, :class_name => '::Refinery::Orders::Order'
      has_many :messages, :class_name => '::Refinery::Messages::Message'
      has_many :favourites, :class_name => 'Favourite'
      has_many :customer_files, :class_name => '::Refinery::CustomerFiles::CustomerFile'
      belongs_to :profile_image, :class_name => '::Refinery::Image'
      has_many :blacklist_customers, :class_name => 'BlacklistCustomer'

      has_and_belongs_to_many :languages, :class_name => 'Refinery::Languages::Language', join_table: 'refinery_customers_languages'
      has_and_belongs_to_many :route_experiences, :class_name => 'Refinery::RouteExperiences::RouteExperience', join_table: 'refinery_customers_routes'

      has_many :aviation_records, :dependent => :destroy
      accepts_nested_attributes_for :aviation_records, :reject_if => lambda { |item| item['employer'].blank?}, :allow_destroy => true

      has_many :references, :dependent => :destroy
      accepts_nested_attributes_for :references, :reject_if => lambda { |item| item['name'].blank?}, :allow_destroy => true

      has_many :flying_hours, :dependent => :destroy
      accepts_nested_attributes_for :flying_hours, :reject_if => lambda { |item| item['aircraft'].blank?}, :allow_destroy => true

      has_many :flying_hours_cabins, :dependent => :destroy
      accepts_nested_attributes_for :flying_hours_cabins, :reject_if => lambda { |item| item['aircraft'].blank?}, :allow_destroy => true

      # has_many :route_experiences, :dependent => :destroy
      # accepts_nested_attributes_for :route_experiences, :reject_if => lambda { |item| item['continent_flown_to'].blank?}, :allow_destroy => true

      has_many :aviation_certification_details, :dependent => :destroy
      accepts_nested_attributes_for :aviation_certification_details, :reject_if => lambda { |item| item['license_type'].blank?}, :allow_destroy => true

      has_many :cabin_certifications, :dependent => :destroy
      accepts_nested_attributes_for :cabin_certifications, :reject_if => lambda { |item| item['license_authority'].blank?}, :allow_destroy => true

      has_many :maintenance_certifications, :dependent => :destroy
      accepts_nested_attributes_for :maintenance_certifications, :reject_if => lambda { |item| item['license_authority'].blank?}, :allow_destroy => true

      has_many :aviation_education_details, :dependent => :destroy
      accepts_nested_attributes_for :aviation_education_details, :reject_if => lambda { |item| item['program'].blank?}, :allow_destroy => true

      has_many :maintenance_hours, :dependent => :destroy
      accepts_nested_attributes_for :maintenance_hours, :reject_if => lambda { |item| item['aircraft'].blank?}, :allow_destroy => true

      has_one :subscription, :class_name => 'Refinery::Subscriptions::Subscription'
      has_one :credit_card, :class_name => 'CreditCard'
      has_many :invoices, :class_name => '::Refinery::Invoices::Invoice'

      # Setup accessible (or protected) attributes for your model
      attr_accessible :first_name, :phone_extension1, :p1, :p2, :p3, :phone_extension2, :other_number, :surname, :contact_number, :fax_number, :company_name, :company_registration_number, :pic_upload,
                      :company_vat_number, :email, :password, :password_confirmation, :remember_me, :province, :sport, :other_sport, :register_for_wholesale, :is_wholesale, :dob, :age, :nationality, :gender, :ppc_date, :ppc_expiry_date, :ir_date, :ir_expiry_date, :total_flying_time, :pass_12_months_hours_flown, :dual_nationality_details, :marital_period, :notice_period, :icao, :military_commitment, :previously_interviewed, :previously_employed, :any_aircraft_accident, :any_criminal_records, :current_position, :current_aircraft, :current_airline, :address, :interviewed_if_yes, :employed_if_yes, :accident_if_yes, :online_application_number, :aviation_records_attributes, :flying_hours_attributes,
                      :route_experiences_attributes, :views_count, :last_notification_id, :cover_letter, :aviation_certification_details_attributes, :aviation_education_details_attributes, :profile_image_id, :image_upload, :customer_file, :date_of_birth, :language_ids,
                      :career_path, :agree_tc, :flying_hours_cabins_attributes, :route_experience_ids, :maintenance_hour_ids, :confirmation_token, :trial_start_at, :trial_end_at, :trial, :free_user

      attr_accessor :image_upload
      attr_accessor :customer_file
      attr_accessor :complete_percentage

      attr_accessor :notification_count, :unread_message_count

      after_initialize :complete_percentage

      acts_as_indexed :fields => [:first_name, :surname, :contact_number, :fax_number, :company_name,
                                  :company_registration_number, :company_vat_number]


      validates_presence_of :first_name, :surname, :contact_number
      #, :contact_number #because of facebook

      validates :terms_and_conditions, inclusion: { in: [true], :message => 'must be checked' }

      def terms_and_conditions
        agree_tc
      end

      #PROVINCES = ['The Eastern Cape', 'The Free State', 'Gauteng', 'KwaZulu-Natal', 'Limpopo', 'Mpumalanga', 'The Northern Cape', 'North West', 'The Western Cape']

      def complete_percentage
        if self.career_path == 'Pilot'
          status_value = 30
          if self.aviation_education_details.present?
              status_value = status_value + 10
          end
          if self.aviation_certification_details.present?
              status_value = status_value + 10
          end
          if self.aviation_records.present?
              status_value = status_value + 10
          end
          if self.flying_hours.present?
              status_value = status_value + 10
          end
          if self.route_experiences.present?
              status_value = status_value + 10
          end
          if self.cover_letter.present?
              status_value = status_value + 10
          end
          if self.references.present?
            status_value = status_value + 10
          end
        elsif self.career_path == 'Cabin Crew'
          status_value = 30
          if self.aviation_education_details.present?
            status_value = status_value + 10
          end
          if self.aviation_records.present?
            status_value = status_value + 10
          end
          if self.cabin_certifications.present?
            status_value = status_value + 10
          end
          if self.flying_hours_cabins.present?
            status_value = status_value + 10
          end
          if self.route_experiences.present?
            status_value = status_value + 10
          end
          if self.cover_letter.present?
            status_value = status_value + 10
          end
          if self.references.present?
            status_value = status_value + 10
          end
        elsif self.career_path == 'Aircraft Maintenance'
          status_value = 40
          if self.aviation_education_details.present?
            status_value = status_value + 10
          end
          if self.aviation_records.present?
            status_value = status_value + 10
          end
          if self.maintenance_certifications.present?
            status_value = status_value + 10
          end
          if self.maintenance_hours.present?
            status_value = status_value + 10
          end
          if self.cover_letter.present?
            status_value = status_value + 10
          end
          if self.references.present?
            status_value = status_value + 10
          end
        else self.career_path == 'other'
          status_value = 40
          if self.aviation_education_details.present?
            status_value = status_value + 10
          end
          if self.cover_letter.present?
            status_value = status_value + 10
          end
          if self.references.present?
            status_value = status_value + 10
          end
        end
        status_value
      end

      def name
        "#{first_name} #{surname}"
      end

      def account_status
        if self.free_user
          status = 'Free User'
        elsif self.trial? and self.trial_vaild? and !self.subscription.present?
          status = 'Trail'
        elsif self.subscription.present? and self.subscription.exp_date.present? and self.subscription.exp_date >= Date.today
          status = 'Active'
        elsif self.trial? and !self.trial_vaild? and !self.subscription.present?
          status = 'Inactive'
        elsif self.subscription.present? and self.subscription.exp_date.present? and self.subscription.exp_date <= Date.today
          status = 'Expired'
        elsif self.subscription.present?
          status = 'Pay per view'
        end
        status
      end

      def current_cart
        self.carts.current.first
      end

      def logo
        self.profile_image
      end

      def trial?
        trial_end_at.present? and trial_start_at.present?
      end

      def trial_vaild?
        trial_end_at >= Date.today
      end

      scope :in_trial, where('trial_end_at >= ?', Date.today)

      def notifications
        Refinery::Notifications::Notification.where(:receiver_id => self.id, :receiver_class => self.class.name)
      end

      def notification_count!
        self.unread_message_count = Refinery::Messages::Message.where('customer_id = ? AND sender = ? AND seen = ?', self.id, 'airline-message', false).count
        self.notification_count = Refinery::Notifications::Notification.where('receiver_id = ? AND receiver_class = ? AND id > ?', self.id, 'Refinery::Customers::Customer', self.last_notification_id.present? ? self.last_notification_id : 0).count
      end

       def self.from_omniauth(auth)
        puts"** #{auth.inspect} **"
        where(provider: auth.provider, uid: auth.uid).first_or_create do |customer|
          customer.agree_tc = true
          customer.provider = auth.provider
          customer.uid = auth.uid
          customer.email = auth.info.email
          customer.first_name = auth.info.first_name
          customer.surname = auth.info.last_name
          if auth.provider == "facebook"
            customer.facebook_image_url = "https://graph.facebook.com/#{customer.uid}/picture?type=large"
            customer.small_facebook_image_url = "https://graph.facebook.com/#{customer.uid}/picture?type=small"
          end

          if auth.provider == "linkedin"
            customer.linkedin_image_url = auth.info.urls.public_profile
          end

          customer.password = Devise.friendly_token[0,20]
          customer.password_confirmation = customer.password
          customer.skip_confirmation!
        end
       end

      def self.to_csv
        CSV.generate do |csv|
          csv << column_names
          all.each do |customer|
            csv << customer.attributes.values_at(*column_names)
          end
        end
      end

    end
  end
end
