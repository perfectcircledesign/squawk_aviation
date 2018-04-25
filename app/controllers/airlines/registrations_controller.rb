class Airlines::RegistrationsController < Devise::RegistrationsController
  before_filter :airline_account, :only =>[:airline_profile, :airline_jobs, :airline_posts]

  def airline_account
    unless airline_signed_in?
      sign_out current_customer if current_customer.present?
      redirect_to '/airlines/sign_in'
    else
      sign_out current_customer if current_customer.present?
      @airline = Refinery::Airlines::Airline.find(current_airline.id)
    end
    @show_nav = true
  end

  def create
    build_resource
    if resource.save
      if resource.active_for_authentication?
        flash[:notice] = "Thank you for signing up with Squawk. Please wait until an administrator has confirmed your account"
        redirect_to "/airlines/sign_in"

        #if resource.respond_to?(:register_for_wholesale)
        #  if resource.register_for_wholesale
        #    users = Refinery::User.all
        #    users.each do |user|
        #      Notifier.request_for_wholesale(user, resource).deliver
        #    end
        #  end
        #end

        #respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  # def pilot_search
  #   @customers = Refinery::Customers::Customer.order('position ASC')
  #   if params[:customer].present? and params[:customer][:nationality].present?
  #     @customers = @customers.where(:nationality => params[:customer][:nationality])
  #     @customers = @customers.where(:dual_nationality_details => params[:customer][:nationality])
  #   end
  #
  #   if params[:age].present?
  #     age = params[:age].split(";")
  #     @customers = @customers.where("age BETWEEN #{age.first} AND #{age.last}")
  #   end
  #
  #   if params[:p1].present?
  #     @customers = @customers.where("p1 > ?", params[:p1])
  #   end
  #   if params[:p2].present?
  #     @customers = @customers.where("p2 > ?", params[:p2])
  #   end
  #   if params[:p3].present?
  #     @customers = @customers.where("p3 > ?", params[:p3])
  #   end
  #
  #   if params[:more_than].present?
  #     @customers = @customers.where(:more_than => true)
  #   end
  #   if params[:turbine].present?
  #     @customers = @customers.where(:turbine => true)
  #   end
  #
  #   @show_nav = true
  #   @stylesheet = 'dashboard'
  #   @customers = @customers.uniq
  # end


  def update


    @airline = Refinery::Airlines::Airline.find(current_airline.id)


    respond_to do |format|
      format.html{
        if @airline.errors.empty?
          @airline.update_attributes(params[:airline])
          if params[:airline][:logo_id].present? and params[:airline][:logo_id].content_type.include? "image"
            image = Refinery::Image.create(:image => params[:airline][:logo_id])
            @airline.logo_id = image.id
          end

          if params[:airline][:image1_upload].present?
            require 'ostruct'
            his_image = RStruct.new(eval(params[:airline][:image1_upload].first.gsub(':','=>').gsub('null','nil')))
            if his_image.present? and his_image.output.type.include? "image"
              image = Refinery::Image.create(:image => Base64.decode64(his_image.output.image['data=>image/png;base64,'.length .. -1]))
              @airline.image1_id = image.id
              @airline.save!
            end
          end

          if params[:airline][:image2_upload].present?
            require 'ostruct'
            his_image = RStruct.new(eval(params[:airline][:image2_upload].first.gsub(':','=>').gsub('null','nil')))
            if his_image.present? and his_image.output.type.include? "image"
              image2 = Refinery::Image.create(:image => Base64.decode64(his_image.output.image['data=>image/png;base64,'.length .. -1]))
              @airline.image2_id = image2.id
              @airline.save!
            end
          end

          if params[:airline][:image3_upload].present?
            require 'ostruct'
            his_image = RStruct.new(eval(params[:airline][:image3_upload].first.gsub(':','=>').gsub('null','nil')))
            if his_image.present? and his_image.output.type.include? "image"
              image3 = Refinery::Image.create(:image => Base64.decode64(his_image.output.image['data=>image/png;base64,'.length .. -1]))
              @airline.image3_id = image3.id
              @airline.save!
            end
          end

          if params[:airline][:image4_upload].present?
            require 'ostruct'
            his_image = RStruct.new(eval(params[:airline][:image4_upload].first.gsub(':','=>').gsub('null','nil')))
            if his_image.present? and his_image.output.type.include? "image"
              image4 = Refinery::Image.create(:image => Base64.decode64(his_image.output.image['data=>image/png;base64,'.length .. -1]))
              @airline.image4_id = image4.id
              @airline.save!
            end
          end

          if params[:airline][:image5_upload].present?
            require 'ostruct'
            his_image = RStruct.new(eval(params[:airline][:image5_upload].first.gsub(':','=>').gsub('null','nil')))
            if his_image.present? and his_image.output.type.include? "image"
              image5 = Refinery::Image.create(:image => Base64.decode64(his_image.output.image['data=>image/png;base64,'.length .. -1]))
              @airline.image5_id = image5.id
              @airline.save!
            end
          end

          if params[:airline][:sliver_upload].present?
            require 'ostruct'
            his_image = RStruct.new(eval(params[:airline][:sliver_upload].first.gsub(':','=>').gsub('null','nil')))
            if his_image.present? and his_image.output.type.include? "image"
              sliver = Refinery::Image.create(:image => Base64.decode64(his_image.output.image['data=>image/png;base64,'.length .. -1]))
              @airline.sliver_id = sliver.id
              @airline.save!
            end
          end



          # images and sliver
          # if params[:airline][:image1_id].present? and params[:airline][:image1_id].content_type.include? "image"
          #   image1 = Refinery::Image.create(:image => params[:airline][:image1_id])
          #   @airline.image1_id = image1.id
          # end
          # if params[:airline][:image2_id].present? and params[:airline][:image2_id].content_type.include? "image"
          #   image2 = Refinery::Image.create(:image => params[:airline][:image2_id])
          #   @airline.image2_id = image2.id
          # end
          # if params[:airline][:image3_id].present? and params[:airline][:image3_id].content_type.include? "image"
          #   image3 = Refinery::Image.create(:image => params[:airline][:image3_id])
          #   @airline.image3_id = image3.id
          # end
          # if params[:airline][:image4_id].present? and params[:airline][:image4_id].content_type.include? "image"
          #   image4 = Refinery::Image.create(:image => params[:airline][:image4_id])
          #   @airline.image4_id = image4.id
          # end
          # if params[:airline][:image5_id].present? and params[:airline][:image5_id].content_type.include? "image"
          #   image5 = Refinery::Image.create(:image => params[:airline][:image5_id])
          #   @airline.image5_id = image5.id
          # end
          # if params[:airline][:sliver_id].present? and params[:airline][:sliver_id].content_type.include? "image"
          #   image6 = Refinery::Image.create(:image => params[:airline][:sliver_id])
          #   @airline.sliver_id = image6.id
          # end

        end

         if @airline.save!
           set_flash_message :notice, :updated
           redirect_to '/airline_account'
         end
      }
      format.js{
        if resource.valid_password?(params[:old_password])
          resource.password = params[resource_name][:password]
          resource.password_confirmation = params[resource_name][:password_confirmation]
          if resource.save
            sign_in resource_name, resource, :bypass => true
          end
        else
          @old_password = true
        end
      }
    end
  end



  def airline_profile
    @airline = Refinery::Airlines::Airline.find(current_airline.id)
  end
  def airline_jobs

  end
  def airline_posts

  end

  # def find_page
  #   @page = ::Refinery::Page.where(:link_url => "/airline_account").first
  # end
end