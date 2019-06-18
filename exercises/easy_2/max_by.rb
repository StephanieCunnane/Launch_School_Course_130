def max_by(arr)
  return nil if arr.empty?
  block_result = []
  arr.each { |elem| block_result << yield(elem) }
  max_idx = block_result.index(block_result.max)
  arr[max_idx]
end

# Given solution
def max_by(arr)
  return nil if arr.empty?
  
  max_element = arr.first
  largest = yield(max_element)
  
  arr[1..-1].each do |elem|
    yielded_value = yield(elem)
    if largest < yielded_value
      largest = yielded_value
      max_element = elem
    end
  end
  
  max_element
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
