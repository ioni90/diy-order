class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_order, only: [:show, :edit]

  def index
    @orders = Order.all.order(id: "DESC")
    @bids = Bid.all
    @closures = Closure.all
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
    @closures = Closure.all
  end

  def edit
  end

  def update
    order = Order.find(params[:id])
    if order.update(order_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    order = Order.find(params[:id])
    if order.destroy
      redirect_to root_path
    else
      render :show
    end
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
