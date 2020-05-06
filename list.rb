require_relative 'item'

class List
  #print styles
    LINE_WIDTH = 49
    INDEX_COL_WIDTH = 5
    ITEM_COL_WIDTH = 20
    DEADLINE_COL_WIDTH = 10
    SOLO_ITEM_WIDTH = LINE_WIDTH / 2
    CHECKMARK = "\u2713".force_encoding('utf-8') # pretty checkmark

  attr_accessor :label
  attr_reader :items

  def initialize(label)
    @items = []
    @label = label
  end

  def [](index)
    items[index]
  end

  def add_item(title, deadline, description = '')
    return false if !Item.valid_date?(deadline)
    @items <<  Item.new(title, deadline, description)
  end

  def size
    items.length
  end

  def valid_index?(index)
    0 <= index && index < self.size
  end

  def swap(index1, index2)
    return false if !valid_index?(index1) || !valid_index?(index2)

    items[index1], items[index2] = items[index2], items[index1]
  end

  def priority
    items.first
  end

  def print
    puts '-'.ljust(LINE_WIDTH, '-')
    puts "#{label.upcase}".center(LINE_WIDTH)
    puts "-".ljust(LINE_WIDTH, '-')
    puts "#{'Index'.ljust(INDEX_COL_WIDTH)} | #{'Item'.ljust(ITEM_COL_WIDTH)} | #{'Deadline'.ljust(DEADLINE_COL_WIDTH)} | Done"
    puts '-'.ljust(LINE_WIDTH, '-')
    items.each_with_index do |item, i|
      status = item.done ? CHECKMARK : ' '
      puts "#{i.to_s.ljust(INDEX_COL_WIDTH)} | #{item.title.ljust(ITEM_COL_WIDTH)} | #{item.deadline.ljust(DEADLINE_COL_WIDTH)} | #{status}" 
    end
    puts "-".ljust(LINE_WIDTH, '-')
  end

  def print_full_item(index)
    item = items[index]
    status = item.done ? CHECKMARK : ' '

    puts '-'.ljust(LINE_WIDTH, '-')
    puts "#{item.title.ljust(SOLO_ITEM_WIDTH)}" + "#{item.deadline} [#{status}]".rjust(SOLO_ITEM_WIDTH)
    puts "#{item.description}"
    puts '-'.ljust(LINE_WIDTH, '-')
  end

  def print_priority
    print_full_item(0)
  end
end