module Refinery
  module Aircrafts
    class Aircraft < Refinery::Core::BaseModel
      self.table_name = 'refinery_aircrafts'      
    
      acts_as_indexed :fields => [:name, :weight, :engine]

      CRAFTS = ["less then", "more then"]
      ENGINES = %w(turbine non-turbine)

      attr_accessible :name, :weight, :engine, :position

      validates :name, :presence => true

      has_many :flying_hours, :class_name => 'flying_hour'

      def self.to_csv
        CSV.generate do |csv|
          csv << column_names
          all.each do |customer|
            csv << customer.attributes.values_at(*column_names)
          end
        end
      end

      def self.import(file)
        spreadsheet = open_spreadsheet(file)
        header = spreadsheet.row(1)
        (2..spreadsheet.last_row).each do |i|
          row = Hash[[header, spreadsheet.row(i)].transpose]
          link = where(:name => row["name"].to_s).first || new
          link.attributes = row.to_hash
          link.save!
        end
      end

      def self.open_spreadsheet(file)
        case File.extname(file.original_filename)
          when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
          when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
          when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
          else raise "Unknown file type: #{file.original_filename}"
        end
      end
              
    end
  end
end
