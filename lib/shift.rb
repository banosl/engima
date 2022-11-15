module Shift
  def shift_loop(alphabet, count, message, letter_shift, length, encrypt)
    loop do
      if !alphabet.include?(message[count])
        count += 4
      else
        letter_to_replace = alphabet.rotate!(alphabet.index(message[count]))
        message.slice!(count)
        if encrypt == true
          message.insert(count, letter_to_replace.rotate(letter_shift).first)
        else
          message.insert(count, letter_to_replace.rotate(-letter_shift).first)
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
  end

  def c_shift(message, shift, encrypt)
    length = message.length
    message.downcase!
    letter_shift = shift[:c]
    alphabet = ('a'..'z').to_a << ' '
    count = 2
    shift_loop(alphabet, count, message, letter_shift, length, encrypt)
  end

  def d_shift(message, shift, encrypt)
    length = message.length
    message.downcase!
    letter_shift = shift[:d]
    alphabet = ('a'..'z').to_a << ' '
    count = 3
    shift_loop(alphabet, count, message, letter_shift, length, encrypt)
  end
end
