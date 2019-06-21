# Group 1
# A Proc object does not raise an error if it's called with too few arguments
# Any parameters that don't get arguments will point to nil
#my_proc = proc { |thing| puts "This is a #{thing}." }
#puts my_proc
#puts my_proc.class
#my_proc.call
#my_proc.call('cat')
  
# Group 2
#my_lambda = lambda { |thing| puts "This is a #{thing}." }
#my_second_lambda = -> (thing) { puts "This is a #{thing}." }
#puts my_lambda
#puts my_second_lambda
#puts my_lambda.class
#my_lambda.call('dog')
# my_lambda.call # raises an ArgumentError
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } # raises a NameError bc there is no Lambda class
# There is no Lambda class, rather lambdas are a type of Proc object
# Unlike regular procs, lambdas do enfore arity and will raise an argument error if they are called with the wrong number of arguments.

# Group 3
#def block_method_1(animal)
#  yield
#end
#
#block_method_1('seal') { |seal| puts "This is a #{seal}." }
# block_method_1('seal') # LocalJumpError: no block given (yield)
# Methods that include 'yield' need to be called with a block, but that block doesn't enforce arity rules.

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}." }
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}." } # raises a NameError
# Extra block parameters that aren't assigned an argument will point to nil.
# In order to be able to use an argument to the block, that argument has to be assigned to a block parameter. AND the block argument to a method can't access the variables local to the method it's associated with.

# Overall, blocks and procs do not enforce arity rules, whereas lambdas do.

