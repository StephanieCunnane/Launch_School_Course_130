factorial = Enumerator.new do |yielder|
  int = 0
  loop do
    if int.zero?
      yielder << 1
    else
      yielder << int.downto(1).to_a.reduce(:*)
    end
    int += 1
  end
end


7.times { puts factorial.next }
factorial.rewind
factorial.take(7).each { |int| puts int }

puts "********************************************"

# Given solution
factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end

7.times { puts factorial.next }

factorial.rewind

factorial.each_with_index do |number, idx|
  puts number
  break if idx == 6
end

