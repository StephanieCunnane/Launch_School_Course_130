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
  
  def all_done
    select(&:done?)
  end
  
  def all_not_done
    select { |todo| !todo.done?}
  end
  
  def done!
    @todos.each(&:done!)
  end
  
  def done?
    @todos.all?(&:done?)
  end
  
  def each
    @todos.each { |todo| yield(todo) }
    self
  end
  
  def find_by_title(str)
    select { |todo| todo.title == str }.first
  end
  
  def first
    @todos.first
  end
  
  def item_at(idx)
    @todos.fetch(idx)
  end
  
  def last
    @todos.last
  end
  
  def mark_all_done
    each(&:done!)
  end
  
  def mark_all_undone
    each(&:undone!)
  end
  
  def mark_done(str)
    find_by_title(str) && find_by_title(str).done!
  end
  
  def mark_done_at(idx)
    item_at(idx).done!
  end
  
  def mark_undone_at(idx)
    item_at(idx).undone!
  end
  
  def pop
    @todos.pop
  end
  
  def remove_at(idx)
    item_at(idx)
    @todos.delete_at(idx)
  end
  
  def select
    new_list = TodoList.new(title)
    each { |todo| new_list << todo if yield(todo) }
    new_list
  end
  
  def shift
    @todos.shift
  end
  
  def size
    @todos.size
  end
  
  def to_a
    @todos.clone
  end
  
  def to_s
    todos = @todos.map { |todo| todo.to_s + "\n" }.join
    "---- Today's Todos ----\n#{todos}" 
  end
end

