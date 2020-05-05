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

  attr_accessor :title, :deadline, :description

  def initialize(title, deadline, description)
    @deadline = deadline
    @title = title
    @description = description
  end

end