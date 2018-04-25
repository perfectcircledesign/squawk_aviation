module Refinery
  module Articles
    class ArticlesController < ::ApplicationController

      before_filter :find_all_articles
      before_filter :find_page, :account
      layout :determine_user_layout

      before_filter :airline_account, :only => [:new, :create, :edit, :update, :destroy]

      def airline_account
        unless airline_signed_in?
          redirect_to '/airlines/sign_in'
        else
          @airline = Refinery::Airlines::Airline.find(current_airline.id)
        end
      end

      def account
       @airline = current_airline
       @customer = current_customer

      end

      def index
        redirect_to '/'
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @article in the line below:
        present(@page)
      end

      def show
        @article = Article.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @article in the line below:
        present(@page)
      end

      def new
        @article = Refinery::Articles::Article.new
      end

      def create
        @article = Refinery::Articles::Article.new(params[:article])

        if @article.errors.empty?
          if params[:article][:image_id].present? and params[:article][:image_id].content_type.include? "image"
            image = Refinery::Image.create(:image => params[:article][:image_id])
            @article.image_id = image.id
            @article.save!
          end
        end

        if @article.save!
          redirect_to '/airline_posts'
        end
      end

      def edit
        @article = Article.find(params[:id])
      end

      def update
        @article = Article.find(params[:id])

        if @article.errors.empty?
          @article.update_attributes(params[:article])

          if params[:article][:image_id].present? and params[:article][:image_id].content_type.include? "image"
            image = Refinery::Image.create(:image => params[:article][:image_id])
            @article.image_id = image.id
            @article.save!
          end
        end

        redirect_to '/airline_posts'
      end

      def destroy
        item = Refinery::Articles::Article.find(params[:id])
        item.destroy

        redirect_to '/airline_posts'
      end

    protected

      def find_all_articles
        @articles = Article.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/articles").first
        @show_nav = true
      end

      def determine_user_layout
        'full'
      end

    end
  end
end
