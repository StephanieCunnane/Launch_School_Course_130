def one?(arr)
  found_truthy = false
  arr.each do |elem|
    boolean_value_of_block = !!yield(elem)
    return false if found_truthy && boolean_value_of_block
    found_truthy = true if boolean_value_of_block
  end
  found_truthy
end

p one?([1, 3, 5, 6]) { |value| value.even? }    == true
p one?([1, 3, 5, 7]) { |value| value.odd? }     == false
p one?([2, 4, 6, 8]) { |value| value.even? }    == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |value| true }           == false
p one?([1, 3, 5, 7]) { |value| false }          == false
p one?([]) { |value| true }                     == false

# Given solution
def one?(arr)
  seen_one = false
  arr.each do |elem|
    next unless yield(elem)
    return false if seen_one
    seen_one = true
  end
  seen_one
end
