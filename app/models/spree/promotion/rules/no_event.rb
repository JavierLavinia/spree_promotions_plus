
module Spree
  class Promotion::Rules::NoEvent < PromotionRule

    def eligible?(order, options = {})
      return false if order.user.blank?
      true
    end

    def selected_products(order)
      order.products.select{|p| !p.event?}
    end
  end
end
