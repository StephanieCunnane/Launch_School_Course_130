def divisors_brute(int)
  1.upto(int).select { |n| int % n == 0 }
end

def divisors_non_brute(int)
  candidates = (1..(int / 2)).to_a
  candidates.select { |candidate| int % candidate == 0 } << int
end

def divisors_non_brute2(int)
  result = []
  1.upto(int) do |n|
    break if result.include?(n)
    if int % n == 0
      result << n
      result << (int / n)
    end
  end
  result.uniq.sort
end

def time_it
  time_before = Time.now
  yield
  time_after = Time.now
  puts "It took #{time_after - time_before} seconds."
end

puts "Testing brute force:"
time_it { divisors_brute(99400891) == [1, 9967, 9973, 99400891] }
puts '******************'
puts "Testing non-brute force:"
time_it { divisors_non_brute(99400891) == [1, 9967, 9973, 99400891] }
puts '******************'
puts "Testing non-brute force2:"
time_it { divisors_non_brute2(99400891) == [1, 9967, 9973, 99400891] }
puts '******************'
puts "Testing non-brute force2 with large input:"
time_it { divisors_non_brute2(999962000357) == [1, 999979, 999983, 999962000357] }
