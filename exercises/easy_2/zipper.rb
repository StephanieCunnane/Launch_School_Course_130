def zip(arr1, arr2)
  result = []
  arr1.each_with_index do |elem, idx|
    result << [elem, arr2[idx]]
  end
  result
end

def zip(arr1, arr2)
  result = []
  idx = 0
  while idx < arr1.size
    result << [arr1[idx], arr2[idx]]
    idx += 1
  end
  result
end

def zip(arr1, arr2)
  arr1.each_with_index.with_object([]) do |(elem, idx), result|
    result << [elem, arr2[idx]]
  end
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
