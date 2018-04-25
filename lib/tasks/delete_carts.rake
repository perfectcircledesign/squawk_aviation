namespace :carts do
  desc "delete all carts and line items after 48 hours"
  task :delete_carts => :environment do
    puts '===== Deleting Carts ======'
    Refinery::Carts::Cart.delete_all
    puts '===== Deleting LineItems ======'
    Refinery::LineItems::LineItem.delete_all
  end
end