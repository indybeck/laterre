hostnames=['test1','test2','test3']

hostnames.each do |h|
  puts "hostname -> #{h}"
end
hostnames.each.with_index(1) do |h, index|
  puts "hostname -> #{h}:#{index}"
end
