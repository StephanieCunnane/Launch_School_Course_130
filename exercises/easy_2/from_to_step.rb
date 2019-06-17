def step(start, stop, step)
  current_num = start
  while current_num <= stop
    yield(current_num)
    current_num += step
  end
  start
end

step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10

# Given solution
def step(start_point, end_point, increment)
  current_value = start_point
  loop do
    yield(current_value)
    break if current_value + increment > end_point
    current_value += increment
  end
  current_value
end
