# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

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


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation
  def add(todo)
    if todo.class == Todo
      todos << todo
    else
      puts "Can only add Todo objects"
      raise TypeError
    end
  end

  def <<(todo)
    add(todo)
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos
  end

  def done?
    todos.map {|todo| todo.done == true }.all?
  end
  
  def item_at(idx)
    if idx == nil
      raise ArgumentError
    elsif idx >= todos.size
      raise IndexError
    else
      todos[idx]
    end
  end

  def mark_done_at(idx)
    idx >= todos.size ? (raise IndexError) : todos[idx].done!
  end

  def mark_undone_at(idx)
    idx >= todos.size ? (raise IndexError) : todos[idx].undone!
  end

  def remove_at(idx)
    idx >= todos.size ? (raise IndexError) : todos.delete_at(idx)
  end
  
  def done!
    todos.each { |todo| todo.done! }
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def to_s
    "---- Today's Todos ----"
    todos.each { |todo| todo}
  end

  def each
    todos.each do |todo|
      yield(todo)
    end
    
    self
  end

  def select
    selected_todos = TodoList.new(title)
  
    todos.each do |todo|
      selected_todos.todos << todo if yield(todo)
    end
  
    selected_todos
  end
end


# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")


list.add(todo1)         
list.add(todo2)         
list.add(todo3) 
# list.add(1) # raises TypeError with message "Can only add Todo objects"

# p list.size # returns 3
# p list.first
# p list.last
# p list.to_a
# p list.done?
# # list.mark_done_at -> raises argument error
# list.mark_done_at(1)
# # list.mark_done_at(100) -> raises index error
# # list.mark_undone_at -> raises argument error
# list.mark_undone_at(1)
# list.done!
# # p list.shift
# # p list.pop
# # list.remove_at -> raises argument error
# # p list.remove_at(1)
# puts list.to_s