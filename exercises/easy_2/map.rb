def map(arr)
  result = []
  arr.each { |elem| result << yield(elem) }
  result
end

def map(arr)
  arr.each_with_object([]) { |elem, result| result << yield(elem) }
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

# With hashes
p map({a: 1, b: 2}) { |_k, v| v + 1 } == [2, 3]
p map({}) { 'hi' } == []

# With sets
require 'set'
p map(Set[1, 2, 3]) { |elem| elem**2 } == [1, 4, 9]
