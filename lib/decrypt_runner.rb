require './enigma'
enigma = Enigma.new
input = ARGV[0]
output = ARGV[1]
key = ARGV[2]
date = ARGV[3]
decryption = enigma.decrypt("mdlliwehqble", key, date)
ARGV[0] = File.read(input, chomp: true)
File.open(output, "w") do |file|
  file.puts decryption[:message]
  puts "created #{output} with the key #{decryption[:key]} and date #{decryption[:date]}"
end
