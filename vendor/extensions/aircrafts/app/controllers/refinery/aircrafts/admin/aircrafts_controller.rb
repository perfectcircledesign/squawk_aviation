module Refinery
  module Aircrafts
    module Admin
      class AircraftsController < ::Refinery::AdminController

        crudify :'refinery/aircrafts/aircraft',
                :title_attribute => 'name', :xhr_paging => true

        def import
          Refinery::Aircrafts::Aircraft.import(params[:file])
          redirect_to refinery.new_aircraft_import_path, notice: "Aircraft imported."
        end

      end
    end
  end
end
