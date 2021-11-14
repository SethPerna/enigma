require './enigma'
enigma = Enigma.new
encryption = enigma.encrypt("Whats up FAM", "12345")
input = ARGV[0]
output = ARGV[1]
ARGV[0] = File.read(input, chomp: true)
File.open(output, "w") do |file|
  file.puts encryption[:message]
  puts "created #{output} with the key #{encryption[:key]} and date #{encryption[:date]}"
end
