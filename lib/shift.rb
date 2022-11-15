module Shift
  def shift_loop(alphabet, count, message, letter_shift, length, encrypt)
    loop do
      if !alphabet.include?(message[count])
        count += 4
      else
        letter = alphabet.rotate!(alphabet.index(message[count]))
        message.slice!(count)
        if encrypt == true
          message.insert(count, letter.rotate(letter_shift).first)
        else
          message.insert(count, letter.rotate(-letter_shift).first)
        end
        count += 4
      end
      break if count >= length
    end
  end

  def a_shift(message, shift, encrypt)
    length = message.length
    message.downcase!
    letter_shift = shift[:a]
    alphabet = ('a'..'z').to_a << ' '
    count = 0
    shift_loop(alphabet, count, message, letter_shift, length, encrypt)
  end

  def b_shift(message, shift, encrypt)
    length = message.length
    message.downcase!
    letter_shift = shift[:b]
    alphabet = ('a'..'z').to_a << ' '
    count = 1
    shift_loop(alphabet, count, message, letter_shift, length, encrypt)

    # loop do
    #   if !alphabet.include?(message[count])
    #     count += 4
    #   else
    #     b_letter = alphabet.rotate!(alphabet.index(message[count]))
    #     message.slice!(count)
    #     if encrypt == true
    #       message.insert(count, b_letter.rotate(shift[:b])[0])
    #     else
    #       message.insert(count, b_letter.rotate(-shift[:b])[0])
    #     end
    #     count += 4
    #   end
    #   break if count >= length
    # end
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

  def d_shift(message, shift, encrypt)
    length = message.length
    message.downcase!
    alphabet = ('a'..'z').to_a << ' '
    count = 3
    loop do
      if !alphabet.include?(message[count])
        count += 4
      else
        d_letter = alphabet.rotate!(alphabet.index(message[count]))
        message.slice!(count)
        if encrypt == true
          message.insert(count, d_letter.rotate(shift[:d])[0])
        else
          message.insert(count, d_letter.rotate(-shift[:d])[0])
        end
        count += 4
      end
      break if count >= length
    end
  end
end
