require './lib/enigma'
require 'pry'

enigma = Enigma.new

message = File.open(ARGV[0], 'r')
# binding.pry
encryption_read = message.read.split(',')[0]
message.close
# binding.pry
decryption = enigma.crack(encryption_read, ARGV[2])
binding.pry
puts "Created 'cracked.txt' with the cracked key and date #{ARGV[2]}"

decrypted_message = File.open(ARGV[1], 'w')
decrypted_message.write(decryption[:decryption], ',', decryption[:key], ',', decryption[:date])
decrypted_message.close