class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def <<(todo_item)
    raise TypeError, "Can only add Todo objects" unless todo_item.instance_of? Todo
    @todos << todo_item
  end
  alias_method :add, :<<

  def item_at(position)
    @todos.fetch(position)
  end

  def mark_done_at(position)
    item_at(position).done!
  end

  def mark_undone_at(position)
    item_at(position).undone!
  end

  def done!
    @todos.each_index do |idx|
      mark_done_at(idx)
    end
  end

  def remove_at(position)
    @todos.delete_at(item_at(position))
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    list = TodoList.new(title)
    each do |todo|
      list.add(todo) if yield(todo)
    end
    list
  end

  # -----Implementing `find_by_title` method------
  def find_by_title(title)
    select { |todo| todo.title == title }.first
  end

  # -----Implementing `all_done` method------
  def all_done
    select { |todo| todo.done? }
  end

# -----Implementing `all_not_done` method------
  def all_not_done
    select { |todo| !todo.done? }
  end

  # -----Implementing `mark_done` method------
  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end

  # -----Implementing `mark_all_done` method------

  def mark_all_done
    select { |todo| todo.done! }
  end

    # -----Implementing `mark_all_undone` method------

  def mark_all_undone
    select { |todo| todo.undone! }
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    @todos.clone
  end
end


# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo4 = Todo.new("administrative work")
list = TodoList.new("Today's Todos")


# ---- Creating custom `select` method  -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
list.add(todo4)

todo1.done!
todo3.done!
# results = list.select { |todo| todo.done? }    # you need to implement this method

# puts results.inspect

# list.each { |todo| puts todo }

# New methods
list.find_by_title("Clean room")
list.all_done
list.all_not_done
# puts list
list.mark_done("Clean room")
# puts list
list.mark_all_done
list.mark_all_undone
puts list
