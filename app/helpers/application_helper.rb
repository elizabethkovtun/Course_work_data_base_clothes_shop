module ApplicationHelper
  def active_link_to(name = nil, options = nil, html_options = nil, &block)
    active_class = html_options[:active] || 'active'
    html_options.delete(:active)
    html_options[:class] = "#{html_options[:class]} #{active_class}" if current_page?(options)
    link_to(name, options, html_options, &block)
  end

  def blank_stars(rating)
    5 - rating
  end

  def allowed_to_comment(product)
    if current_user
      allowed_products = []
      current_user.order_items.uniq(&:product_id).each do |order_product|
        allowed_products << order_product.product_id
      end
      allowed_products.include?(product.id)
    end
  end
end
