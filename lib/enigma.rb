require 'date'
require 'pry'

class Enigma
  def encrypt(message, message_key, message_date)
    hash = {
      encryption: message,
      key: message_key,
      date: message_date
    }
  end
end
