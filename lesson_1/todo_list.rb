# This class represents a todo item and its associated data: name and description
# There's also a 'done' flag to show whether this todo item is done

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
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(new_todo)
    raise TypeError, "Can only add Todo objects" unless new_todo.instance_of?(Todo)
    @todos << new_todo
  end

  alias :<< :add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.clone
  end

  def done?
    @todos.all?(&:done?)
  end

  def item_at(idx=nil)
    validate_index(idx)
    @todos[idx]
  end

  def mark_done_at(idx=nil)
    validate_index(idx)
    @todos[idx].done!
  end

  def mark_undone_at(idx=nil)
    validate_index(idx)
    @todos[idx].undone!
  end

  def done!
    @todos.each(&:done!)
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(idx=nil)
    validate_index(idx)
    @todos.delete_at(idx)
  end

  def to_s
    puts "------ #{title} ------"
    puts @todos
  end

  def each
    @todos.each { |todo| yield(todo) }
    self
  end

  def select
    new_list = TodoList.new(title)
    each { |todo| new_list.add(todo) if yield(todo) }
    new_list
  end

  private

  def validate_index(idx)
    raise ArgumentError if idx.nil?
    raise IndexError unless (0..@todos.size - 1).include?(idx)
  end
end

# Create our objects
todo1 = Todo.new('Buy milk')
todo2 = Todo.new('Clean room')
todo3 = Todo.new('Go to gym')
list = TodoList.new("Today's Todos")

# Add todos to the list
#######################
list.add(todo1) # adds todo1 to end of list, returns list
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }

puts results.inspect
