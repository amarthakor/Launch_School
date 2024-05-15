# - We now want to add a few more methods that can piggy-back off of the 
# - TodoList#each and TodoList#select methods. Implement the below methods.
#
# - Hint: use either TodoList#each or TodoList#select for the implementation.
#
# - TodoList Class	Description
# - find_by_title	takes a string as argument, and returns the first Todo object
# - that matches the argument. Return nil if no todo is found.
#
# - all_done	returns new TodoList object containing only the done items
# - all_not_done	returns new TodoList object containing only the not done items
# - mark_done	takes a string as argument, and marks the first Todo object that 
# - matches the argument as done.
#
# - mark_all_done	mark every todo as done
# - mark_all_undone	mark every todo as not done