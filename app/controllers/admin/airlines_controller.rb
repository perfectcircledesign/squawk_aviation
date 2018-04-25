class Admin::AirlinesController < AdminController

  def index
    @airlines = Refinery::Airlines::Airline.all
  end

  def show
    @airline= Refinery::Airlines::Airline.find_by_id(params[:id])
    @favourite_airlines = Refinery::Airlines::Airline.eager_load(:favourites).where('favourites.who_favourite = ? AND favourites.customer_id = ? AND favourites.airline_id = refinery_airlines.id', 'pilot', @airline.id)
  end

end