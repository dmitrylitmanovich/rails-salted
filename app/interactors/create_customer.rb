class CreateCustomer
  include Interactor

  def call
    order = Order.create(order_params)

    if order.persisted?
      context.order = order
    else
      context.fail!
    end
  end

  def rollback
    context.order.destroy
  end
end
