def select
  selected_todos = TodoList.new(title)

  todos.each do |todo|
    selected_todos.todos << todo if yield(todo)
  end

  selected_todos
end