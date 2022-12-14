require 'date'
require_relative 'shift'
require 'pry'

class Enigma
  include Shift
  def encrypt(message, message_key = rand.to_s[2..6], message_date = Date.today.strftime('%m%d%y'))
    shift_encrypt(message, message_key, message_date)
  end

  def decrypt(message, message_key, message_date)
    shift_decrypt(message, message_key, message_date)
  end

  def crack(message, message_date = Date.today.strftime('%m%d%y'))
    shift_crack(message, message_date)
  end

  def build_key(message_key)
    {
      a: "#{message_key[0]}#{message_key[1]}",
      b: "#{message_key[1]}#{message_key[2]}",
      c: "#{message_key[2]}#{message_key[3]}",
      d: "#{message_key[3]}#{message_key[4]}"
    }
  end

  def reverse_key(keys)
    reversed = ''
    keys.each do |_key, num|
      reversed << ((num + 27).to_s[-1])
    end
    reversed.insert(0, '0') until reversed.length == 5
    reversed
  end

  def build_offset(message_date)
    squared = (message_date.to_i**2).to_s
    {
      a: "#{squared[-4]}",
      b: "#{squared[-3]}",
      c: "#{squared[-2]}",
      d: "#{squared[-1]}"
    }
  end

  def key_plus_offset(keys, offsets)
    {
      a: keys[:a].to_i + offsets[:a].to_i,
      b: keys[:b].to_i + offsets[:b].to_i,
      c: keys[:c].to_i + offsets[:c].to_i,
      d: keys[:d].to_i + offsets[:d].to_i
    }
  end

  def shift_minus_offset(shift, offsets)
    {
      a: (shift[:a] - offsets[:a].to_i),
      b: (shift[:b] - offsets[:b].to_i),
      c: (shift[:c] - offsets[:c].to_i),
      d: (shift[:d] - offsets[:d].to_i)
    }
  end

  def determine_shift(message)
    message.reverse!
    tail = 'dne '
    shift = {
      a: (message[0].ord - tail[0].ord),
      b: (message[1].ord - tail[1].ord),
      c: (message[2].ord - tail[2].ord),
      d: (message[3].ord - 123) + 27
    }
  end

  def shift_encrypt(message, message_key, message_date, encrypt = true, crack = false)
    keys = build_key(message_key)
    offsets = build_offset(message_date)
    shift = key_plus_offset(keys, offsets)

    a_shift(message, shift, encrypt, crack)
    b_shift(message, shift, encrypt, crack)
    c_shift(message, shift, encrypt, crack)
    d_shift(message, shift, encrypt, crack)
    {
      encryption: message,
      key: message_key,
      date: message_date
    }
  end

  def shift_decrypt(message, message_key, message_date, encrypt = false, crack = false)
    keys = build_key(message_key)
    offsets = build_offset(message_date)
    shift = key_plus_offset(keys, offsets)

    a_shift(message, shift, encrypt, crack)
    b_shift(message, shift, encrypt, crack)
    c_shift(message, shift, encrypt, crack)
    d_shift(message, shift, encrypt, crack)
    {
      decryption: message,
      key: message_key,
      date: message_date
    }
  end

  def shift_crack(message, message_date, encrypt = false, crack = true)
    offsets = build_offset(message_date)
    shift = determine_shift(message)
    keys = shift_minus_offset(shift, offsets)

    a_shift(message, shift, encrypt, crack)
    b_shift(message, shift, encrypt, crack)
    c_shift(message, shift, encrypt, crack)
    d_shift(message, shift, encrypt, crack)

    message.reverse!
    message_key = reverse_key(keys)
    {
      decryption: message,
      date: message_date,
      key: message_key
    }
  end
end
