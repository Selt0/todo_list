require 'date'

class Item

  def self.valid_date?(date)
    begin
      Date.iso8601(date)
      true
    rescue => exception
      false
    end
  end

  attr_accessor :title, :description
  attr_reader :done, :deadline

  def initialize(title, deadline, description)
    @deadline = deadline
    @title = title
    @description = description
    @done = false
  end

  def toggle
    @done = !@done
  end
  
  def deadline=(new_deadline)
    raise 'Invalid date' if !Item.valid_date?(new_deadline)
    @deadline = new_deadline
  end
end