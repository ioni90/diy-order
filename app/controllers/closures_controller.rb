class ClosuresController < ApplicationController

  def create
    @closure = Closure.new(closure_params)
    unless @closure.valid?
      redirect_to root_path and return
    end
    
    session["closure_data"] = @closure.attributes
    @address = @closure.build_address
    render :new_address

  end

  def create_address
    @closure = Closure.new(session["closure_data"])
    @address = Address.new(address_params)
     unless @address.valid?
       render :new_address and return
     end
    
    @closure.build_address(@address.attributes)
    if @closure.save
      @address[:closure_id] = @closure.id
      @address.save
    end
    session["closure_data"].clear
    pay_item
    render :create_address
  end

  def show
    @order = Order.find(params[:order_id])
    @closure = Closure.find_by(order_id: @order.id)
    @bid = Bid.find(params[:format])
  end

  private

  def closure_params
    params.permit(:reply, :order_id, :bid_id)
  end

  def address_params
    params.require(:address).permit(:name, :postal_code, :prefecture_id, 
                                    :location, :building, :phone).merge(token: params[:token])
  end

  def pay_item
    @order = Order.find(params[:order_id])
    @bid = Bid.find_by(order_id: @order.id)

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    if @bid.offer_price
      Payjp::Charge.create(
        amount: @bid.offer_price,
        card: address_params[:token],
        currency: 'jpy'
      )
    else
      Payjp::Charge.create(
        amount: @order.price,
        card: address_params[:token],
        currency: 'jpy'
      )
    end
  end

end
