class Admin::MerchantsController < ApplicationController

  def index
    @merchants = Merchant.all
    @merchants_enabled = Merchant.enabled_merchants
    @merchants_disabled = Merchant.disabled_merchants
    @top5 = Merchant.top_5_merchants
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def new
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:id])
    if params[:button] == 'disabled'
      @merchant.update(status: 'Disabled')
      @merchant.save
      redirect_to "/admin/merchants"
    elsif params[:button] == 'enabled'
      @merchant.update(status: 'Enabled')
      @merchant.save
      redirect_to "/admin/merchants/"
    elsif params[:button] == nil
      @merchant.update(name: params[:name])
      @merchant.save
      redirect_to "/admin/merchants/#{@merchant.id}"
      flash[:success] = "You updated Merchant"
    end
  end

  def create
    Merchant.create(name: params[:name])
    redirect_to '/admin/merchants'
  end

end
