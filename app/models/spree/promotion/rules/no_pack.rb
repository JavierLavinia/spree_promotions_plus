
module Spree
  class Promotion::Rules::NoPack < PromotionRule

  def eligible?(order, options = {})
    return false if order.user.blank?
    true
  end

  def selected_products(order)
    order.line_items.map do |line_item|
      variant = line_item.variant
      variant.product if variant.pack_price? && variant.pack_quantity? && line_item.quantity >= variant.pack_quantity
    end.flatten.compact
  end
  end
end
