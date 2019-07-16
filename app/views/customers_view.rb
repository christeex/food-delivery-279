require_relative 'base_view'

class CustomersView < BaseView
  def display(customers) # an array of instances
    customers.each do |customer|
      puts "#{customer.id} | #{customer.name} - #{customer.address}"
    end
  end
end
