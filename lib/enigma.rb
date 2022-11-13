require 'date'
require 'pry'

class Enigma
  def encrypt(message, message_key = rand.to_s[2..6], message_date = Date.today.strftime('%m%d%y'))
    shift_letter_encrypt(message, message_key, message_date)

    hash = {
      encryption: message,
      key: message_key,
      date: message_date
    }
  end

  def decrypt(message, message_key = rand.to_s[2..6], message_date = Date.today.strftime('%m%d%y'))


    hash = {
        decryption: message,
        key: message_key,
        date: message_date
      }
  end

  def build_key(message_key)
    abcd_keys = {
      a: "#{message_key[0]}#{message_key[1]}",
      b: "#{message_key[1]}#{message_key[2]}",
      c: "#{message_key[2]}#{message_key[3]}",
      d: "#{message_key[3]}#{message_key[4]}"
    }
  end

  def build_offset(message_date)
    squared = (message_date.to_i**2).to_s
    abcd_offset = {
      a: "#{squared[-4]}",
      b: "#{squared[-3]}",
      c: "#{squared[-2]}",
      d: "#{squared[-1]}"
    }
  end

  def key_plus_offset(keys, offsets)
    sum = {
      a: keys[:a].to_i + offsets[:a].to_i,
      b: keys[:b].to_i + offsets[:b].to_i,
      c: keys[:c].to_i + offsets[:c].to_i,
      d: keys[:d].to_i + offsets[:d].to_i
    }
  end

  def shift_letter_encrypt(message, message_key, message_date)
    keys = build_key(message_key)
    offsets = build_offset(message_date)
    shift = key_plus_offset(keys, offsets)
    message.downcase!
    length = message.length

    # A shift
    alphabet = ('a'..'z').to_a << ' '
    count = 0
    loop do
      if !alphabet.include?(message[count])
        count += 4
      else
        a_letter = alphabet.rotate!(alphabet.index(message[count]))
        message.slice!(count)
        message.insert(count, a_letter.rotate(shift[:a])[0])
        count += 4
      end
      break if count >= length
    end

    # B shift
    alphabet = ('a'..'z').to_a << ' '
    count = 1
    loop do
      if !alphabet.include?(message[count])
        count += 4
      else
        b_letter = alphabet.rotate!(alphabet.index(message[count]))
        message.slice!(count)
        message.insert(count, b_letter.rotate(shift[:b])[0])
        count += 4
      end
      break if count >= length
    end

    # C shift
    alphabet = ('a'..'z').to_a << ' '
    count = 2
    loop do
      if !alphabet.include?(message[count])
        count += 4
      else
        c_letter = alphabet.rotate!(alphabet.index(message[count]))
        message.slice!(count)
        message.insert(count, c_letter.rotate(shift[:c])[0])
        count += 4
      end
      break if count >= length
    end

    # D shift
    alphabet = ('a'..'z').to_a << ' '
    count = 3
    loop do
      if !alphabet.include?(message[count])
        count += 4
      else

        d_letter = alphabet.rotate!(alphabet.index(message[count]))
        message.slice!(count)
        message.insert(count, d_letter.rotate(shift[:d])[0])
        count += 4
      end
      break if count >= length
    end
    message
  end # Shift encrypt method end

  def shift_letter_decrypt(message, message_key, message_date)
    keys = build_key(message_key)
    offsets = build_offset(message_date)
    shift = key_plus_offset(keys, offsets)
    message.downcase!
    length = message.length
binding.pry
    # A shift
    alphabet = ('a'..'z').to_a << ' '
    count = 0
    loop do
      if !alphabet.include?(message[count])
        count += 4
      else
        a_letter = alphabet.rotate!(alphabet.index(message[count]))
        message.slice!(count)
        message.insert(count, a_letter.rotate(shift[:a])[0])
        count += 4
      end
      break if count >= length
    end

    # B shift
    alphabet = ('a'..'z').to_a << ' '
    count = 1
    loop do
      if !alphabet.include?(message[count])
        count += 4
      else
        b_letter = alphabet.rotate!(alphabet.index(message[count]))
        message.slice!(count)
        message.insert(count, b_letter.rotate(shift[:b])[0])
        count += 4
      end
      break if count >= length
    end

    # C shift
    alphabet = ('a'..'z').to_a << ' '
    count = 2
    loop do
      if !alphabet.include?(message[count])
        count += 4
      else
        c_letter = alphabet.rotate!(alphabet.index(message[count]))
        message.slice!(count)
        message.insert(count, c_letter.rotate(shift[:c])[0])
        count += 4
      end
      break if count >= length
    end

    # D shift
    alphabet = ('a'..'z').to_a << ' '
    count = 3
    loop do
      if !alphabet.include?(message[count])
        count += 4
      else

        d_letter = alphabet.rotate!(alphabet.index(message[count]))
        message.slice!(count)
        message.insert(count, d_letter.rotate(shift[:d])[0])
        count += 4
      end
      break if count >= length
    end
    message
  end # Shift decrypt method end






end # Enigma class end
