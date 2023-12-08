# what does this print out? Can you explain these results?
# name = 'Bob'
# save_name = name
# name.upcase!
# puts name, save_name

# On `line 5` we invoke the puts method and pass 2 arguments, the value referenced
# by the local variable `name` and the value referenced by local variable
# `save_name`. This will output the string BOB. This occurs because on `line 2`, we 
# initialize the local variable `name` and assign it to the string `Bob`. On `line 3`, 
# we initialize the local variable `save_name`, and assign it to the value
# local variable `name` references, which is the string `Bob`. On `line 4`, we
# invoke the `upcase!` method on the value `name` references, which is the
# string 'Bob'. Since this is a mutating method, it directly mutates the
# original object in memory that is referenced by both variables `name` and
# `save_name`. Since the `upcase!` method upper cases the object it is called on,
# both variables will reflect that change and now output the string object
# `BOB`