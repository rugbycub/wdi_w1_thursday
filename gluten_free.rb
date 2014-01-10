require "pry"

#Title: Gluten_Free
 
#Prerequisites:
#- Ruby
#    - Exceptions
#    - Hashes & Arrays
#    - Objects & Classes
 
#Objectives:
#- Work with exceptions, classes, class variables, conditions
 
#======================================================================"
 
# Create a Person class. A person will have a stomach and allergies
# Create a method that allows the person to eat and add arrays of food to their stomachs
# If a food array contains a known allergy reject the food.
class AllergyError < ArgumentError; end

class Person

	def initialize(allergies = nil, stomach=[])
		@stomach = stomach
		@allergies = allergies
	end

	def eat(food)
		food.each {|food| @stomach.push(food)}
		if @stomach.include? @allergies
				@stomach.each {|x| @stomach.pop()}
				raise AllergyError.new("This person is allergic to #{@allergies}")
		end
		puts @stomach
	end

end
 
# Create a Person named Chris. Chris is allergic to gluten.
# Create a Person named Beth. Beth is allergic to scallops.
# Feed them the following foods
pizza = ["cheese", "gluten", "tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]

# When a person attempts to eat a food they are allergic to, raise a custom exception
# For example:  AllergyError
 chris = Person.new("gluten")

 chris.eat(pizza)
 

# Bonus: When a person attempts to eat a food they are allergic to,
#        ... remove ALL the food from the person's stomach before raising the exception