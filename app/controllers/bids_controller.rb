class BidsController < ApplicationController

  def new
    @order = Order.find(params[:order_id])
  end

  def create
    @bid = Bid.new(bid_params)
    if @bid.valid?
      @bid.save
      redirect_to root_path
    else
      render :new
    end
  end

private

def bid_params
  params.permit( :price_ok, :size_ok, :material_ok, 
                               :detail_ok, :delivery_time_ok,
                               :price_remark, :size_remark, :material_remark,
                               :detail_remark, 
                               :delivery_time_remark, :message, 
                               :order_id).merge(user_id: current_user.id)
end

end
