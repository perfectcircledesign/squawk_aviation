namespace :db do
  desc "Remove deleted products from the carts, this should have been handled by foreign key but was forgotten"
  task :remove_deleted_products_from_carts => :environment do
    ::Refinery::Carts::Cart.all.each do |cart|
      cart.line_items.each do |li|
        if li.product.blank?
          li.delete
        end
      end
    end
  end
end