module ApplicationHelper
  include Refinery::Copywriting::CopywritingHelper

  def rands(amount)
    number_to_currency(amount, :unit => 'R', :precision => 0 )
  end

  def cents(amount)
    (amount * 100).round(0).to_i
  end

  def country_name(code)
    country = ISO3166::Country[code]
    if country.present?
      country.translations[I18n.locale.to_s] || country.name
    end
  end

  def customer_airline_favourite(customer_id, airline_id, who)
    favourite = Favourite.where('customer_id = ? AND airline_id = ? AND who_favourite = ?', customer_id, airline_id, who).first
    if favourite.present?
      true
    else
      false
    end
  end

  def is_blacklisted(customer_id, airline_id)
    blacklist = BlacklistCustomer.where('customer_id = ? AND airline_id = ?', customer_id, airline_id).first
    if blacklist.present?
      true
    else
      false
    end
  end

  def customer_job_favourite(customer_id, job_id)
    favourite = Favourite.where('customer_id = ? AND job_id = ?', customer_id, job_id).first
    if favourite.present?
      true
    else
      false
    end
  end

  # def last_message(sender)
  #   if current_airline.present?
  #     Refinery::Messages::Message.where('customer_id = ? AND airline_id = ?', sender.id, current_airline.id).order('created_at DESC').first
  #   elsif current_customer.present?
  #     Refinery::Messages::Message.where('customer_id = ? AND airline_id = ?', current_customer.id, sender.id).order('created_at DESC').first
  #   end
  # end

  def unread_count(sender)
    if current_airline.present?
      sender.messages.where('customer_id = ? AND airline_id = ? AND sender = ? AND seen = ?', sender.id, current_airline.id, 'user-message', false).count
    elsif current_customer.present?
      sender.messages.where('customer_id = ? AND airline_id = ? AND sender = ? AND seen = ?', current_customer.id, sender.id, 'airline-message', false).count
    end
  end

  def checksum(order, unique_guid)
    require 'digest/md5'

    values = []
    values << ::Refinery::Setting.find_or_set(:paygate_id, '10011013800')
    values << unique_guid
    values << cents(order.grand_total)
    values << "ZAR"
    values << refinery.orders_order_payment_response_url(order)
    values << date_to_utc(order.created_at)
    values << order.customer.email
    values << ::Refinery::Setting.find_or_set(:paygate_secret, 'secret')
    value_to_hash = values.join('|')

    logger.info "************** values_to_hash = #{value_to_hash}"

    Digest::MD5.hexdigest(value_to_hash)
  end

  def date_to_utc(time)
    time.strftime('%Y-%m-%d %H:%M:%S')
  end

  def determine_product_link(product, category=nil)
    category.present? ? refinery.categories_category_product_path(:category_id => category, :id => product) : refinery.products_product_path(product)
  end

  def personal_details_values(customer)
    items = []
    items << "Email: #{customer.email}" if customer.email.present?
    items << "Phone: #{customer.contact_number}" if customer.contact_number.present?
    items << "Fax: #{customer.fax_number}" if customer.fax_number.present?
    items << customer.company_name if customer.company_name.present?
    items << customer.company_registration_number if customer.company_registration_number.present?
    items << customer.company_vat_number if customer.company_vat_number.present?

    items.join('<br />')
  end

  def sanitize_csv_field(value)
    if value.present?
      if value.respond_to?(:gsub)
        value.gsub(',', ' ')
      else
        value
      end
    else
      ' '
    end
  end
end
