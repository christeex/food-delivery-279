require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repo)
    @customer_repo = customer_repo
    @customers_view = CustomersView.new
  end

  def list
    customers = @customer_repo.all
    @customers_view.display(customers)
  end

  def add
    name = @customers_view.ask_for("name")
    address = @customers_view.ask_for("address")
    customer = Customer.new(name: name, address: address)
    @customer_repo.add(customer)
  end
end





