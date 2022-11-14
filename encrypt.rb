require './lib/enigma'
require 'pry'

enigma = Enigma.new

message = File.open(ARGV[0], "r")
read_message = message.read.split(",")
message.close

encryption = enigma.encrypt(*read_message)

puts "Created #{ARGV[1]} with the key #{encryption[:key]} and date #{encryption[:date]}"

encrypted_message = File.open(ARGV[1], "w")
encrypted_message.write(encryption)
encrypted_message.close