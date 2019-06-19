# Bubble sort, no blocks
# until we make a pass with no swaps, keep iterating through
# the array, doing a swap if needed
def bubble_sort!(arr)
  loop do
    swapped = false
    1.upto(arr.size - 1) do |idx|
      if block_given?
        next if yield(arr[idx - 1], arr[idx])
      else
        next if arr[idx - 1] <= arr[idx]
      end
      arr[idx - 1], arr[idx] = arr[idx], arr[idx - 1]
      swapped = true
    end
    break unless swapped
  end
  nil
end

def bubble_sort_by!(arr)
  loop do
    swapped = false
    1.upto(arr.size - 1) do |idx|
      next if yield(arr[idx - 1]) <= yield(arr[idx])
      arr[idx - 1], arr[idx] = arr[idx], arr[idx - 1]
      swapped = true
    end
    break unless swapped
  end
  nil
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort_by!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)
