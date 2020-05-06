# **ToDo list**

A todo list in ruby!

---

List of commands:

- `mklist <new_list_label>`

  Make a new list with the given label

  ```ruby
  mklist tech

  mklist groceries
  ```

- `ls`

  print the labels of all lists

- `showall`

  print all lists

- `mktodo <list_label> <item_title> <item_deadline> <optional_item_description>`

  makes a todo with the given information

  ```ruby
      mktodo tech ruby 2019-10-24

      mktodo groceries candy 2019-10-31 sugar-free
  ```

- `toggle <list_label> <item_index>`

  toggle 'done' for the specified item on the given list

  ```ruby
  toggle tech 2
  ```

- `rm <list_label> <item_index>`

  remove the specified item on the given list

  ```ruby
  rm tech 4"
  ```

- `purge <list_label>`

  remove all 'done' items on the given list

  ```ruby
  purge groceries
  ```

- `up <list_label> <item_index> <optional_amount>`

  raises the todo up the list (by 1 if no amount enterd)

  ```ruby
  up groceries 3 5

  up tech 3
  ```

- `down <list_label> <item_index> <optional_amount>`

  lowers the todo down the list (by 1 if no amount entered)

  ```ruby
  down chores 3

  down tech  2 4
  ```

- `swap <list_label> <item_index_1> <item_index_2>`

  swaps the position of todos

  ```ruby
  swap tech 3 6
  ```

- `sort <list_label>`

  sorts the todos by date

  ```ruby
  sort tech
  ```

- `priority <list_label>`

  prints the todo at the top of the list

  ```ruby
  priority groceries
  ```

- `print <list_label> <optional_index>`

  ```ruby
  print tech
  ```

  prints all todos if no index is provided

  ```ruby
  print tech 4
  ```

  prints full information of the specified todo if an index is provided

- `q` or `quit`

  quits the program

- `?` or `help`

  displays list of commands

---

Run the program by with ruby

```ruby

todo = TodoBoard.new

```

this will save your todo list in `todo`.

Then just `todo.run` to start it up.

_Feel free to name it anything :D_
