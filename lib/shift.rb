module Shift
  
    # A shift
  def a_shift(message, shift, encrypt)
    length = message.length
    message.downcase!
    alphabet = ('a'..'z').to_a << ' '
    count = 0
    loop do
      if !alphabet.include?(message[count])
        count += 4
      else
        a_letter = alphabet.rotate!(alphabet.index(message[count]))
        message.slice!(count)
        if encrypt == true
          message.insert(count, a_letter.rotate(shift[:a])[0])
        else
          message.insert(count, a_letter.rotate(shift[:a])[0])
        end
        count += 4
      end
      break if count >= length
    end
  end
end
