require './enigma'
enigma = Enigma.new
input = ARGV[0]
output = ARGV[1]
encryption = enigma.encrypt(File.read(input).tr("\n", ""))
File.open(output, "w") do |file|
  file.puts encryption[:message]
  puts "created #{output} with the key #{encryption[:key]} and date #{encryption[:date]}"
end
