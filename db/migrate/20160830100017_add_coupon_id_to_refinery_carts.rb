class AddCouponIdToRefineryCarts < ActiveRecord::Migration
  def change
    add_column :refinery_carts, :coupon_id, :integer
  end
end
