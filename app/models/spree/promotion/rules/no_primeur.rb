
module Spree
  class Promotion::Rules::NoPrimeur < PromotionRule

    def eligible?(order, options = {})
      return false if order.user.blank?
      true
    end

    def selected_products(order)
      order.products.select{|p| !p.primeur?}
    end
  end
end
