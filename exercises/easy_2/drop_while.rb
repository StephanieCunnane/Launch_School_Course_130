def drop_while(arr)
  temp_arr = arr.dup
  arr.each do |elem|
    return_value_of_block = yield(elem)
    temp_arr.shift if return_value_of_block
    return temp_arr unless return_value_of_block
  end
  temp_arr
end

# Given solution
def drop_while(arr)
  idx = 0
  while idx < arr.size && yield(arr[idx])
    idx += 1
  end
  arr[idx..-1]
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []

