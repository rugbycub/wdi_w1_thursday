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


#create allergy error
class AllergyError < ArgumentError; end

#create person class
class Person

	#initialize person class
	def initialize(allergies = nil, stomach=[])
		@stomach = stomach
		@allergies = allergies
	end

	#define eat and pass in food array
	def eat(food)

		#add food array to somach contents
		food.each {|food| @stomach.push(food)}

		#check if any ingredient matches the allergies
		if @stomach.include? @allergies

				#if yes, empty contents of stomach array and raise allergy error
				@stomach.each {|x| @stomach.pop()}
				begin
					raise AllergyError.new("#{@allergies}")
				rescue AllergyError => e
					puts "there was an allergic reaction to #{e}"
				end
		end
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
beth = Person.new("scallops")

 chris.eat(pizza)
 beth.eat(pan_seared_scallops)

# Bonus: When a person attempts to eat a food they are allergic to,
#        ... remove ALL the food from the person's stomach before raising the exception