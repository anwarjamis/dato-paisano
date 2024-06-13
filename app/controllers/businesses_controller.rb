class BusinessesController < ApplicationController
  before_action :set_business, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[show index]

  def show
  end

  def index
    @businesses = Business.all
    @businesses = @businesses.where(subcategory_id: params[:subcategory_id]) if params[:subcategory_id].present?
  end

  def new
    @business = Business.new
    @categories = Category.all.includes(:subcategories)
  end

  def create
    @business = Business.new(business_params)
    @business.user = current_user
    if @business.save
      redirect_to success_path
    else
      render 'new'
    end
  end

  def edit
    @categories = Category.all.includes(:subcategories)
  end

  def update
    @categories = Category.all.includes(:subcategories)
    if @business.update(business_params)
      redirect_to business_path(@business)
    else
      raise
      render 'edit'
    end
  end

  def destroy
    @business.destroy
    redirect_to my_businesses_path
  end

  def my_businesses
    @businesses = Business.where(user_id: current_user.id)
  end

  private

  def set_business
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:name, :description, :email, :link, :instagram, :facebook, :tiktok, :phone, :type_id, :subcategory_id)
  end
end
