class AdminController < ActionController::Base
  def dashboard
    @dashboard_customers = Refinery::Customers::Customer
    @dashboard_airlines = Refinery::Airlines::Airline
    @dashboard_jobs = Refinery::Jobs::Job
    @dashboard_articles = Refinery::Articles::Article

    @dashboard_customers_paid = []
    @dashboard_pilot = []
    @dashboard_cabin = []
    @dashboard_maintenance = []

    @dashboard_customers.all.each do |cust|
      if cust.invoices.present?
        @dashboard_customers_paid << cust
      end
    end

    @dashboard_customers_paid.each do |cust|
      if cust.career_path == 'Pilot'
        @dashboard_pilot << cust
      elsif cust.career_path == 'Cabin Crew'
        @dashboard_cabin << cust
      elsif cust.career_path == 'Aircraft Maintenance'
        @dashboard_maintenance << cust
      end
    end

  end
end
