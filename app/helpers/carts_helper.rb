module CartsHelper
  # Current order
  def current_order
    unless @_current_order
      @_current_order = Order.find_by_user_id(current_user.id)
      @_current_order = Order.new(user_id: current_user.id) if @_current_order.nil?
    end
    
    @_current_order
	end
end
