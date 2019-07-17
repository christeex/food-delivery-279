require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repo)
    @employee_repo = employee_repo
    @sessions_view = SessionsView.new
  end

  def log_in
    username = @sessions_view.ask_for("username")
    password = @sessions_view.ask_for("password")
    employee = @employee_repo.find_by_username(username)
    # employee is either nil or an INSTANCE
    if employee && employee.password == password
      # an instance (with the right password) will go in here
      @sessions_view.welcome(employee)
    else
      # nil will go in here
      @sessions_view.wrong_credentials
      log_in
    end
    return employee
  end
end
