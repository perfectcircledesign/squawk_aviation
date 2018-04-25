module Refinery
  module Carts
    class CartsController < ::PublicController

      def add_to_cart
        product = ::Refinery::Products::Product.find(params[:id])
        if product.price.present?
          @current_cart.add_to_the_cart(product.id, params[:quantity])
          respond_to do |format|
            format.html {redirect_to refinery.cart_path}
            format.js {redirect_to refinery.cart_path :product_id => product.id }
          end
        else
          flash[:error] = 'Sorry, the product that you selected is not available yet.'
        end
      end

      def show
        @page = ::Refinery::Page.where(:link_url => "/cart").first
        if params[:product_id].present?
          @product = ::Refinery::Products::Product.find_by_id(params[:product_id])
        end
        present(@page)
        respond_to do |format|
          format.html
          format.js
        end
      end

    end
  end
end
