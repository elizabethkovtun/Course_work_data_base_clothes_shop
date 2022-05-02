class OrderItemsController < ApplicationController

def create
    cart = current_order.order_items.find_by(product_id: params[:product_id])
    if cart.present?
      cart.update(quantity: cart.quantity + 1)
    else
      cart = current_order.order_items.create(product_id: params[:product_id], user: current_user)

    end
    redirect_to root_path, notice: 'Added to cart'
  end

  def update
    order_item = OrderItem.find(params[:id])
    redirect_to order_path(current_order)
  end

  def remove_quantity
    order_item = OrderItem.find(params[:id])
    order_item.update(quantity: order_item.quantity - 1)
    order_item.destroy if order_item.quantity == 0
    redirect_to order_path(current_order)
  end

  def add_quantity
    order_item = OrderItem.find(params[:id])
    order_item.update(quantity: order_item.quantity + 1)
    redirect_to order_path(current_order)
  end

  def destroy
    order_item = OrderItem.find(params[:id])
    order_item.destroy
    redirect_to order_path(current_order)
  end
end
