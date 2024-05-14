class Dog

	def initialize(name)
		@name = name
	end
	
	def change_name=(name)
		self.name = name.capitalize
	end
	
	private
	
	attr_writer :name
end

zues = Dog.new('Zues')
zues.change_name = 'hulk'
p zues