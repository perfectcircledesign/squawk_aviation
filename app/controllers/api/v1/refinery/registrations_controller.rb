class Api::V1::Refinery::RegistrationsController < Api::V1::BaseController
  respond_to :json
  before_filter :set_user, :only => [:update]
  skip_before_filter :authenticate_user_from_token!

  def create
    puts "PARAMS ---- #{user_params}"

    if user_params[:password].present? and User.where(email: user_params[:email]).blank? and Practice.where(email: user_params[:email]).blank?
      @user = User.new(user_params)
      if @user.save
        @auth_token = jwt_token(@user)
        Practice.set_email(@user)
      end
    else
      render json: {errors:{email:['has already been taken']},response:{code:422}}
    end
  end


  def update
    @user.update(user_params)
  end

  def set_user
    @user = User.find_by_id(user_params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :id, :name, :surname, :practitioner_number, :qualification, :email, :role_id, :permissions_attributes => [{:practice_attributes => [:name]}, :admin, :practice_id])
  end






end
