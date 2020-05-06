require_relative 'list'

class TodoBoard
  def initialize
    @board = {}
  end

  def get_command
    print "\nEnter a command: "
    command, target, *args = gets.chomp.split(' ')
    return false if command == 'quit' || command == 'q'
    case command
    when 'mklist'
      @board[target] = List.new(target)
    when 'ls'
      @board.keys.each { |label| puts ' ' + label }
    when 'showall'
      @board.each_value(&:print)
    when 'mktodo'
      @board[target].add_item(*args)
    when 'toggle'
      @board[target].toggle_item(args[0].to_i)
    when 'rm'
      @board[target].remove_item(args[0].to_i)
    when 'purge'
      @board[target].purge
    when 'up'
      @board[target].up(*args.map(&:to_i))
    when 'down'
      @board[target].down(*args.map(&:to_i))
    when 'swap'
     @board[target].swap(*args.map(&:to_i))
    when 'sort'
      @board[target].sort_by_date!
    when 'priority'
      @board[target].print_priority
    when 'print'
      if args.empty?
        @board[target].print
      else
        @board[target].print_full_item(args[0].to_i)
      end
    when 'help'
      help
    when '?'
      help
    when 'q'
      return false
    when 'quit'
      return false
    else
      print "That command is not recognized\n"
    end
    true
  end

  def help
    puts '-'.ljust(80, '-')
    puts 'Commands'.center(75)
    puts
    puts "mklist <new_list_label>".center(75)
    puts "make a new list with the given label".center(75)
    puts
    puts "Ex: mklist tech".center(75)
    puts "----------".center(75)

    puts
    puts "ls".center(75)
    puts "print the labels of all lists".center(75)
    puts "----------".center(75)

    puts
    puts "showall".center(75)
    puts "print all lists".center(75)
    puts "----------".center(75)

    puts
    puts "mktodo <list_label> <item_title> <item_deadline> <optional_item_description>".center(75)
    puts "makes a todo with the given information".center(75)
    puts
    puts "Ex: mktodo tech ruby 2019-10-24".center(75)
    puts "Ex: mktodo groceries candy 2019-10-31 sugar-free"
    puts "----------".center(75)

    puts
    puts "toggle <list_label> <item_index>".center(75)
    puts "toggle 'done' for the specified item on the given list".center(75)
    puts
    puts "Ex: toggle tech 2".center(75)
    puts "----------".center(75)

    puts
    puts "rm <list_label> <item_index>".center(75)
    puts "remove the specified item on the given list".center(75)
    puts
    puts "Ex: rm tech 4".center(75)
    puts "----------".center(75)

    puts
    puts "purge <list_label>".center(75)
    puts "remove all 'done' items on the given list".center(75)
    puts
    puts "Ex: purge Groceries".center(75)
    puts "----------".center(75)

    puts
    puts "up <list_label> <item_index> <optional_amount>".center(75)
    puts "raises the todo up the list (by 1 if no amount enterd)".center(75)
    puts
    puts "Ex: up groceries 3 5".center(75)
    puts "Ex: up tech 3".center(75)
    puts "----------".center(75)

    puts
    puts "down <list_label> <item_index> <optional_amount>".center(75)
    puts "lowers the todo down the list (by 1 if no amount entered)".center(75)
    puts
    puts "Ex: down chores 1".center(75)
    puts "----------".center(75)
    
    puts
    puts "swap <list_label> <item_index_1> <item_index_2>".center(75)
    puts "swaps the position of todos".center(75)
    puts
    puts "Ex: swap tech 3 6".center(75)
    puts "----------".center(75)

    puts
    puts "sort <list_label>".center(75)
    puts "sorts the todos by date".center(75)
    puts "----------".center(75)

    puts
    puts "priority <list_label>".center(75)
    puts "prints the todo at the top of the list".center(75)
    puts "----------".center(75)

    puts
    puts "print <list_label> <optional_index>".center(75)
    puts
    puts "Ex: print tech".center(75)
    puts "prints all todos if no index is provided".center(75)
    puts
    puts "Ex: print tech 4".center(75)
    puts "prints full information of the specified todo if an index is provided".center(75)
    puts "----------".center(75)

    puts
    puts "quit".center(75)
    puts '-'.ljust(80, '-')
  end

  def run
    tooltip
    while true
      return if !get_command
    end
  end

  def tooltip
    puts
    puts "Enter '?' or 'help' for a list of commands"
  end
end


TodoBoard.new.run