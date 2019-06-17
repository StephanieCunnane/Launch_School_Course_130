def count(arr)
  truthy_block_count = 0
  arr.each { |elem| truthy_block_count += 1 if yield(elem) }
  truthy_block_count
end


# Further Exploration
def count(arr, &block)
  arr.select(&block).size
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

