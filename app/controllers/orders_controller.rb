class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    binding.pry
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :story, 
                                  :type_id, :price, 
                                  :size, :material, :detail, 
                                  :delivery_time_id).merge(user_id: current_user.id)
  end

end
