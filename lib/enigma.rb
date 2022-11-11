require 'date'
require 'pry'

class Enigma
  def encrypt(message, message_key, message_date = Date.today.strftime("%m%d%y"))
    # binding.pry
    hash = {
      :encryption => message,
      :key => message_key,
      :date => message_date
    }
  end
end
