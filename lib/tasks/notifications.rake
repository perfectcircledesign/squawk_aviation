namespace :trial do
  desc "Trial Notifications"
  task :notifications => :environment do

    ::Refinery::Customers::Customer.all.each do |customer|
      next unless customer.trial? and customer.trial_vaild?
      
      case (customer.trial_end_at - Date.today).to_i
        # when 1
        #   puts "1 Day Left"
        #   Notifier.reminder(customer, 1).deliver
        # when 2
        #   puts "2 Day Left"
        #   Notifier.reminder(customer, 2).deliver
        when 7
          puts "7 Day Left"
          Notifier.reminder(customer, 7).deliver
        when 0
          puts "Trial END"
          Notifier.trial_end(customer).deliver
      end
      
      
    end


  end
end