require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repo)
    @meal_repo = meal_repo
    @meals_view = MealsView.new
  end

  def list
    meals = @meal_repo.all
    @meals_view.display(meals)
  end

  def add
    name = @meals_view.ask_for("name")
    price = @meals_view.ask_for("price").to_i
    meal = Meal.new(name: name, price: price)
    @meal_repo.add(meal)
  end
end





