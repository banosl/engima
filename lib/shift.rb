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

  # B shift
  def b_shift(message, shift, encrypt)
    length = message.length
    message.downcase!
    alphabet = ('a'..'z').to_a << ' '
    count = 1
    loop do
      if !alphabet.include?(message[count])
        count += 4
      else
        b_letter = alphabet.rotate!(alphabet.index(message[count]))
        message.slice!(count)
        if encrypt == true
          message.insert(count, b_letter.rotate(shift[:b])[0])
        else
          message.insert(count, b_letter.rotate(-shift[:b])[0])
        end
        count += 4
      end
      break if count >= length
    end
  end

  def c_shift(message, shift, encrypt)
    length = message.length
    message.downcase!
    alphabet = ('a'..'z').to_a << ' '
    count = 2
    loop do
      if !alphabet.include?(message[count])
        count += 4
      else
        c_letter = alphabet.rotate!(alphabet.index(message[count]))
        message.slice!(count)
        if encrypt == true
          message.insert(count, c_letter.rotate(shift[:c])[0])
        else
          message.insert(count, c_letter.rotate(-shift[:c])[0])
        end
        count += 4
      end
      break if count >= length
    end
  end
end
