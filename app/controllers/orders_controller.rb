class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_order, only: [:show]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:name, :story, 
                                  :type_id, :price, 
                                  :size, :material, :detail, 
                                  :delivery_time_id).merge(user_id: current_user.id)
  end

  def set_order
    @order = Order.find(params[:id])
  end

end
