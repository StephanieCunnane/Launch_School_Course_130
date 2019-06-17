def missing(arr)
  (arr.first..arr.last).to_a - arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# Given solution
def missing(arr)
  result = []
  arr.each_cons(2) do |first, second|
    result.concat(((first + 1)...second).to_a)
  end
  result
end
