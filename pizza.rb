class Pizza
	attr_accessor :toppings, :delivery_time
	def initialize(toppings = [Topping.new('cheese', vegetarian: true)], delivery_time = nil)
		@toppings = toppings
		@delivery_time = delivery_time
	end

	def vegetarian?
		@toppings.all? { |t| t.vegetarian == true }	
	end

	def add_topping(topping)
		@toppings << topping
		
	end
end

class Topping
	attr_accessor :name, :vegetarian
	def initialize(name, vegetarian: false)
		@name = name
		@vegetarian = vegetarian
	end
end
