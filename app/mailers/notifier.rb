class Notifier < ActionMailer::Base
  default :from => "no-reply@squawkaviation.com"
  helper ApplicationHelper

  # def order_invoice(order)
  #   @order = order
  #   mail(:to => order.customer.email, :subject => "Repcillin: Order Invoice #{order.order_number}")
  # end
  #
  # def payment_confirmation(order)
  #   @order = order
  #   mail(:to => order.customer.email, :subject => "Repcillin: Payment Confirmation #{order.order_number}")
  # end
  #
  # def order_complete(order)
  #   @order = order
  #   mail(:to => order.customer.email, :subject => "Repcillin: Order Complete #{order.order_number}")
  # end
  #
  # def admin_order_complete(order)
  #   @order = order
  #   mail(:to => "john@repcillin.com, webadmin@perfectcircle.co.za", :subject => "Repcillin: Order Complete #{order.order_number}")
  # end

  # Admin Email
  def payment_failed(customer, log_body)
    @customer = customer
    @log = log_body
    mail(:to => ::Refinery::Setting.find_or_set(:payment_admin_emails, 'webadmin@perfectcirlce.co.za; info@squawkaviation.com'), :subject => "Squawk: client payment failed")
  end

  def client_payment_failed(customer, log_body)
    @customer = customer
    @log = log_body
    mail(:to => @customer.email, :subject => "Squawk: client payment failed")
  end

  # Admin Email
  def account_suspend(customer, log_body)
    @customer = customer
    @log = log_body
    mail(:to => ::Refinery::Setting.find_or_set(:payment_admin_emails, 'webadmin@perfectcirlce.co.za; info@squawkaviation.com'), :subject => "Squawk: client account suspended")
  end

  def client_account_suspend(customer, log_body)
    @customer = customer
    @log = log_body
    mail(:to => @customer.email, :subject => "Squawk: account suspended")
  end

  #invoice
  def mail_invoice(invoice)
    @invoice = invoice
    mail(:to => @invoice.customer.email, :subject => "Squawk: Invoice")
  end


  def new_airline(item)
    @airline = item
    mail(:to => ::Refinery::Setting.find_or_set(:new_airline_admin_emails, 'webadmin@perfectcirlce.co.za; info@squawkaviation.com'), :subject => "Squawk: New Airline")
  end

  def new_valid_airline(item)
    @airline = item
    mail(:to => item.email, :subject => "Squawk: Valid")
  end

  def welcome(customer)
    @customer = customer
    mail(:to => customer.email, :subject => "Squawk: Welcome")
  end

  def reminder(customer, number_of_days)
    @customer = customer
    @number_of_days = number_of_days
    mail(:to => customer.email, :subject => "Squawk: Reminder")
  end

  def trial_end(customer)
    @customer = customer
    mail(:to => customer.email, :subject => "Squawk: Trial End", :bcc => 'marlene@squawkaviation.com')
  end



end