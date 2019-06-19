birds = ['crow', 'finch', 'hawk', 'eagle']

def assign_elements(arr)
  yield(arr)
end

assign_elements(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}" 
end
