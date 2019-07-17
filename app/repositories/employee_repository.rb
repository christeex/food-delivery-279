require 'csv'
require_relative 'base_repository'
require_relative '../models/employee'

class EmployeeRepository < BaseRepository
  def find_by_username(username) # returns an INSTANCE
    @elements.find do |element|
      element.username == username
    end
  end

  def build_element(row)
    row[:id] = row[:id].to_i
    Employee.new(row)
  end
end


