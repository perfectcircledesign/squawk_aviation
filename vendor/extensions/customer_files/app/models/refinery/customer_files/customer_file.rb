require 'dragonfly'
module Refinery
  module CustomerFiles
    class CustomerFile < Refinery::Core::BaseModel
      self.table_name = 'refinery_customer_files'
      ::Refinery::CustomerFiles::Dragonfly.setup!

      customer_file_accessor :file

      validates :file, :presence => true
      validates_with  Refinery::Resources::Validators::FileSizeValidator

      belongs_to :customer, :class_name => '::Refinery::Customers::Customer'

      attr_accessible :file, :position, :customer_id
      acts_as_indexed :fields => [:file_mime_type, :file_name, :file_uid, :file_ext]

      delegate :ext, :size, :mime_type, :url, :to => :file

      # used for searching
      def type_of_content
        mime_type.split("/").join(" ")
      end

      # Returns a titleized version of the filename
      # my_file.pdf returns My File
      def title
        CGI::unescape(file_name.to_s).gsub(/\.\w+$/, '').titleize
      end

      class << self
        def create_customer_files(params)
          resources = []

          unless params.present? and params[:file].is_a?(Array)
            resources << create(params)
          else
            params[:file].each do |resource|
              resources << create(:file => resource)
            end
          end

          resources
        end
      end
    end
  end
end
