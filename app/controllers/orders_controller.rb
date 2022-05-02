class OrdersController < ApplicationController
  def show
    @items = current_order.order_items
  end

  def  update
    current_product = @order.order_items.find_by(product_id: params[:product_id])

    if current_product.present?
      current_product.update(quantity: current_product.quantity + 1)
    else
      @order.order_items.create.create(product_id: params[:product_id], quantity: 1)
    end

    redirect_to order_path(current_order)
  end

  def complete
     Order.find(params[:id]).update(status: 1)
    OrderMailer.with(user: current_user).complete_order.deliver_now
  end

  private

  def set_current_order
    @order = current_order
  end
end