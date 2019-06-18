def each_cons(arr, n)
  repetitions = (arr.size - n) + 1
  repetitions.times do |idx|
    yield(*arr[idx, n])
  end
  nil
end

# Given solution
def each_cons(arr, n)
  arr.each_index do |idx|
    break if idx + n - 1 >= arr.size
    yield(*arr[idx..(idx + n - 1)])
  end
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}
####################################################

# Manual pattern below
# How do I generalize this?
# I have the value of the array size and the sequence size. Now I need
# to programatically determine the number of repetitions.

# arr_size: 5
# sequence size (n): 1
# repetitions: 5

# arr_size: 5
# sequence size (n): 2
# repetitions: 4

# arr_size: 5
# sequence_size (n): 3
# repetitions: 3

# arr_size: 5
# sequence_size (n): 4
# repetitions: 2

# arr_size: 5
# sequence size (n): 5
# repetitions: 1

# (arr_size - sequence_size) + 1
