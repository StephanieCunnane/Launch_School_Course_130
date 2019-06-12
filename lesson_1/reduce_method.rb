def reduce(arr, initial=nil)
  accumulator = initial.nil? ? arr.first : initial
  starting_idx = initial.nil? ? 1 : 0
  
  starting_idx.upto(arr.size - 1) { |idx| accumulator = yield(accumulator, arr[idx]) } 
  
  accumulator
end

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']

