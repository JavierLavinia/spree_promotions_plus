
module Spree
  class Promotion::Rules::NoClub < PromotionRule

    def eligible?(order, options = {})
      return false if order.user.blank?
      return true unless order.user.respond_to?(:club?)

      !order.user.club?
    end

    def selected_products(order)
      order.products
    end
  end
end
