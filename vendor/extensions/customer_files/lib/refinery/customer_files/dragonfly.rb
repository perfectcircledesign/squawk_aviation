require 'dragonfly'

module Refinery
  module CustomerFiles
     module Dragonfly

      class << self
        def setup!
          app_resources = ::Dragonfly[:refinery_customer_files]

          app_resources.define_macro(::Refinery::CustomerFiles::CustomerFile, :customer_file_accessor)

          app_resources.analyser.register(::Dragonfly::Analysis::FileCommandAnalyser)
          app_resources.content_disposition = :attachment
        end

        def configure!
          app_resources = ::Dragonfly[:refinery_customer_files]
          app_resources.configure_with(:rails) do |c|
            c.datastore.root_path = Refinery::CustomerFiles.datastore_root_path
            c.url_format = Refinery::CustomerFiles.dragonfly_url_format
            c.secret = Refinery::CustomerFiles.dragonfly_secret
          end

          if ::Refinery::CustomerFiles.s3_backend
            app_resources.datastore = ::Dragonfly::DataStorage::S3DataStore.new
            app_resources.datastore.configure do |s3|
              s3.bucket_name = Refinery::CustomerFiles.s3_bucket_name
              s3.access_key_id = Refinery::CustomerFiles.s3_access_key_id
              s3.secret_access_key = Refinery::CustomerFiles.s3_secret_access_key
              # S3 Region otherwise defaults to 'us-east-1'
              s3.region = Refinery::CustomerFiles.s3_region if Refinery::CustomerFiles.s3_region
            end
          end

        end

        def attach!(app)
          ### Extend active record ###
          app.config.middleware.insert_before Refinery::CustomerFiles.dragonfly_insert_before,
                                              'Dragonfly::Middleware', :refinery_resources

          app.config.middleware.insert_before 'Dragonfly::Middleware', 'Rack::Cache', {
            :verbose     => Rails.env.development?,
            :metastore   => "file:#{URI.encode(Rails.root.join('tmp', 'dragonfly', 'cache', 'meta').to_s)}",
            :entitystore => "file:#{URI.encode(Rails.root.join('tmp', 'dragonfly', 'cache', 'body').to_s)}"
          }
        end
      end

    end
  end
end
