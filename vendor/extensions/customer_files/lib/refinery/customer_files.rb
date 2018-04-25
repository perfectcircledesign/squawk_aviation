require 'refinerycms-core'

module Refinery
  autoload :CustomerFilesGenerator, 'generators/refinery/customer_files_generator'

  module CustomerFiles
    require 'refinery/customer_files/engine'
    require 'refinery/customer_files/configuration'

    autoload :Dragonfly, 'refinery/customer_files/dragonfly'
    autoload :Validators, 'refinery/resources/validators'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
