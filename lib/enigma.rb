require 'date'
require 'pry'

class Enigma
  def encrypt(message, message_key = rand.to_s[2..6], message_date = Date.today.strftime("%m%d%y"))
    # binding.pry
    hash = {
      :encryption => message,
      :key => message_key,
      :date => message_date
    }
  end

  def build_key(message_key = rand.to_s[2..6])
    # binding.pry
    abcd_keys = {
                :a =>  "#{message_key[0]}#{message_key[1]}",
                :b =>  "#{message_key[1]}#{message_key[2]}",
                :c =>  "#{message_key[2]}#{message_key[3]}",
                :d =>  "#{message_key[3]}#{message_key[4]}"
    }
  end
end