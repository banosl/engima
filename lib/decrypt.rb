require './lib/enigma'
require 'pry'

enigma = Enigma.new

message = File.open(ARGV[0], 'r')
encryption_read = message.read.split(',')[0]
message.close

decryption = enigma.decrypt(encryption_read, ARGV[2], ARGV[3])

puts "Created #{ARGV[1]} with the key #{decryption[:key]} and date #{decryption[:date]}"

decrypted_message = File.open(ARGV[1], 'w')
decrypted_message.write(decryption[:decryption], ',', decryption[:key], ',', decryption[:date])
decrypted_message.close
