
module Spree
  class Promotion::Rules::Club < PromotionRule

    def eligible?(order, options = {})
      # 41557 si el usuario es invitado y esta comprando
      # la tarjeta hay que aplicarle ventajas del club
      return order.include_card? if order.user.blank?
      return false unless order.user.respond_to?(:club?)

      order.user.club?
    end
  end
end
