class ReferencesController < ApplicationController
  before_filter :authenticate_customer!

  def new

  end

  def create
    @reference = Reference.new(params[:reference])
    if @reference.save!
      redirect_to '/account#reference_tag'
    end
  end

  def edit

  end

  def update
    @reference = Reference.find(params[:id])
    if @reference.update_attributes(params[:reference])
      redirect_to '/account#reference_tag'
    end
  end

  def destroy
    item = Reference.find(params[:id])
    item.destroy
    # flash[:notice] = 'File Successfully Deleted'
    redirect_to '/account#reference_tag'
  end
end
