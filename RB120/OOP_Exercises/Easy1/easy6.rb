=begin

Consider the following class definition:


class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

There is nothing technically incorrect about this class, 
but the definition may lead to problems in the future. 
How can this class be fixed to be resistant to future problems?

- On instantiation of a Flight class object we initialize 2 instance vars
  - @flight number to the argument passed during the instatntion process
  - @db_hdnle to a Database.init instantiation process
- We also have attr_accessor :database_handle
  - lets us retrieve the value of @databse_handle
  - lets us set a new value of @database_handle

- Maybe we don't want others haivng the ability to reset value of the @database_handle?
  - in that case change attr_Accessor to attr_reader 
    - in case someone needs the ability to see flight info, but not change it for malicious intent
=end

class Flight
  attr_reader :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end