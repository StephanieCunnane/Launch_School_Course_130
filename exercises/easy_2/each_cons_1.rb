def each_cons(arr)
  (arr.size - 1).times do |idx|
    yield(arr[idx, 2])
  end
  nil
end

# Given solution
def each_cons(arr)
  arr.each_with_index do |elem, idx|
    break if idx + 1 >= arr.size
    yield(elem, arr[idx + 1])
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil
