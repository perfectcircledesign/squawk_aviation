class Admin::CustomersController < AdminController

  def index
    @customers = Refinery::Customers::Customer.all
  end

  def show
    @customer = Refinery::Customers::Customer.find_by_id(params[:id])
    @favourite_airlines = Refinery::Airlines::Airline.eager_load(:favourites).where('favourites.who_favourite = ? AND favourites.customer_id = ? AND favourites.airline_id = refinery_airlines.id', 'pilot', @customer.id)
    @favourited = Refinery::Airlines::Airline.eager_load(:favourites).where('favourites.who_favourite = ? AND favourites.customer_id = ? AND favourites.airline_id = refinery_airlines.id', 'Airline', @customer.id)
    @invoices = Refinery::Invoices::Invoice.where(:customer_id => @customer.id)
  end

end