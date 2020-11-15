class ClosuresController < ApplicationController

  def create
    @closure = Closure.new(closure_params)
    if @closure.valid?
      
      @closure.save
      redirect_to order_bid_path(:order_id)
    else
      redirect_to root_path
    end
  end

  def show
    @closure = Closure.find(params[:format])
    @order = Order.find(params[:order_id])
    @bid = Bid.find(params[:format])
  end

  private

  def closure_params
    params.permit(:reply, :order_id, :bid_id)
  end

end
