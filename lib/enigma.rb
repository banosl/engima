require 'date'
require 'pry'

class Enigma
  def encrypt(message, message_key = rand.to_s[2..6], message_date = Date.today.strftime('%m%d%y'))
    # binding.pry
    keys = build_key(message_key)
    offsets = build_offset(message_date)
    # binding.pry
    key_plus_offset(keys, offsets)

    hash = {
      encryption: message,
      key: message_key,
      date: message_date
    }
  end

  def build_key(message_key)
    # binding.pry
    abcd_keys = {
      a: "#{message_key[0]}#{message_key[1]}",
      b: "#{message_key[1]}#{message_key[2]}",
      c: "#{message_key[2]}#{message_key[3]}",
      d: "#{message_key[3]}#{message_key[4]}"
    }
  end

  def build_offset(message_date)
    squared = (message_date.to_i**2).to_s
    # binding.pry
    abcd_offset = {
      a: "#{squared[-4]}",
      b: "#{squared[-3]}",
      c: "#{squared[-2]}",
      d: "#{squared[-1]}"
    }
  end

  def key_plus_offset(keys, offsets)
    # binding.pry
    sum = {
      a: keys[:a].to_i + offsets[:a].to_i,
      b: keys[:b].to_i + offsets[:b].to_i,
      c: keys[:c].to_i + offsets[:c].to_i,
      d: keys[:d].to_i + offsets[:d].to_i
    }
    # binding.pry
  end

  def shift_letter(message)
    # binding.pry
    message.downcase!
    length = message.length

    # A shift
    alphabet = ('a'..'z').to_a << ' '
    count = 0
    loop do
      a_letter = alphabet.rotate!(alphabet.index(message[count]))
      message.slice!(count)
      message.insert(count, a_letter.rotate(3)[0])
      count += 4
      break if count >= length
    end

    # B shift
    alphabet = ('a'..'z').to_a << ' '
    count = 1
    loop do
      b_letter = alphabet.rotate!(alphabet.index(message[count]))
      message.slice!(count)
      message.insert(count, b_letter.rotate(27)[0])
      count += 4
      break if count >= length
    end

    # C shift
    alphabet = ('a'..'z').to_a << ' '
    count = 2
    loop do
      c_letter = alphabet.rotate!(alphabet.index(message[count]))
      message.slice!(count)
      message.insert(count, c_letter.rotate(73)[0])
      count += 4
      break if count >= length
    end

    # D shift
    alphabet = ('a'..'z').to_a << ' '
    count = 3
    loop do
      d_letter = alphabet.rotate!(alphabet.index(message[count]))
      message.slice!(count)
      message.insert(count, d_letter.rotate(20)[0])
      count += 4
      break if count >= length
    end
    message
  end
end