class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    puts "Welcome to the Le Wagon Restaurant!"
    puts "           --           "

    employee = @sessions_controller.log_in
    while @running
      if employee.manager?
        display_manager_tasks
      else
        display_delivery_tasks
      end
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    # when 5 then @controller.mark_as_done
    when 6 then run
    when 7 then stop
    else
      puts "Please press 1, 2, 3, 4 or 5"
    end
  end

  def stop
    @running = false
  end

  def display_manager_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - List all customers"
    puts "4 - Add a customer"
    # puts "5 - Mark a recipe as done"
    puts "6 - Log out"
    puts "7 - Stop and exit the program"
  end

  def display_delivery_tasks
    puts "TODO: Delivery person tasks"
  end
end
