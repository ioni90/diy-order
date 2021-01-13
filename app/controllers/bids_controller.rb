class BidsController < ApplicationController
  before_action :bid_info, only: [:show]

  def new
    @bid = Bid.new
    @order = Order.find(params[:order_id])
  end

  def create
    @bid = Bid.new(bid_params)
    if @bid.valid?
      @bid.save
      redirect_to root_path
    else
      @order = Order.find(params[:order_id])
      render :new
    end
  end

  def show
    @order = Order.find(params[:order_id])
  end

private

  def bid_params
    @order = Order.find(params[:order_id])
    params.require(:bid).permit(:offer_price, :price_ok, :size_ok, :material_ok, 
                                :detail_ok, :delivery_ok,
                                :price_remark, :size_remark, :material_remark,
                                :detail_remark, 
                                :delivery_time_remark, :message, 
                                :order_id).merge(user_id: current_user.id, order_id: @order.id)
  end

  def bid_info
    @bid = Bid.find(params[:id])
  end

end
