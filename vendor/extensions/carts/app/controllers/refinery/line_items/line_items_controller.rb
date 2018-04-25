module Refinery
  module LineItems
    class LineItemsController < ::PublicController

      def destroy
        @current_cart.line_items.where(:product_id => params[:id]).first.destroy
        # ::Refinery::LineItems::LineItem.destroy(params[:id])
        flash[:notice] = 'Product removed successfully'
        respond_to do |format|
          format.html {redirect_to refinery.cart_path}
          format.js {@product = Refinery::Products::Product.find(params[:id])}
        end
      end

    end
  end
end
