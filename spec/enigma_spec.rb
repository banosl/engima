require 'simplecov'
SimpleCov.start
require './lib/enigma'
require 'date'
require 'pry'

RSpec.describe Enigma do
  describe '#encrypt' do
    before(:each) do
      @enigma = Enigma.new
    end

    it 'enigma exists' do
      expect(@enigma).to be_instance_of(Enigma)
    end

    it '#encrypt takes three arguments and makes a hash' do
      expect(@enigma.encrypt('hello world', '02715', '040895')).to be_instance_of(Hash)
      expect(@enigma.encrypt('hello world', '02715', '040895')[:key]).to eq('02715')
      expect(@enigma.encrypt('hello world', '02715', '040895')[:date]).to eq('040895')
    end

    it '#encrypt when no date is given, it defaults the date value to todays date' do
      expect(@enigma.encrypt('hello world', '02715')[:date]).to eq(Date.today.strftime('%m%d%y'))
    end

    it '#encrypt when no key is given, generates a random one' do
      expect(@enigma.encrypt('hello world')[:key].length).to eq(5)
    end

    it '#build_key can create A,B,C, and D keys from the key' do
      key = '02715'
      expect(@enigma.build_key(key)).to be_instance_of(Hash)
      expect(@enigma.build_key(key)).to eq({ a: '02', b: '27', c: '71', d: '15' })

      key = rand.to_s[2..6]
      expect(@enigma.build_key(key)[:a].length).to eq(2)
    end

    it '#build_offset can create A,B,C, and D offsets from the date' do
      offset = '040895'
      expect(@enigma.build_offset(offset)).to be_instance_of(Hash)
      expect(@enigma.build_offset(offset)).to eq({ a: '1', b: '0', c: '2', d: '5' })

      offset = Date.today.strftime('%m%d%y')
      expect(@enigma.build_offset(offset)[:a].length).to eq(1)
    end

    it '#key_plus_offset' do
      keys = @enigma.build_key('02715')
      offsets = @enigma.build_offset('040895')

      expect(@enigma.key_plus_offset(keys, offsets)).to be_instance_of(Hash)
      expect(@enigma.key_plus_offset(keys, offsets)).to eq({ a: 3, b: 27, c: 73, d: 20 })

      key = '02715'
      offset = '040895'
      keys = @enigma.build_key(key)
      offsets = @enigma.build_offset(offset)

      expect(@enigma.key_plus_offset(keys, offsets)).to be_instance_of(Hash)
    end

    it '#shift_letter_encrypt can change the characters to another for encryption' do
      expect(@enigma.shift_letter_encrypt('hello world', '02715', '040895')).to eq('keder ohulw')
      expect(@enigma.shift_letter_encrypt('HELLO WORLD', '02715', '040895')).to eq('keder ohulw')
      expect(@enigma.shift_letter_encrypt('HELLO WORLD!', '02715', '040895')).to eq('keder ohulw!')
    end

    it '#shift letter_encrypt is incorporated into #encrypt' do
      expect(@enigma.encrypt('hello world', '02715', '040895')[:encryption]).to eq('keder ohulw')
      expect(@enigma.encrypt('hello world', '02715', '040895')[:key]).to eq('02715')
      expect(@enigma.encrypt('hello world', '02715', '040895')[:date]).to eq('040895')
    end

    it '#encrypt can encrypt without a date' do
      expect(@enigma.encrypt('hello world', '02715')[:encryption]).to eq('qkjdxfug rb')
      expect(@enigma.encrypt('hello world', '02715')[:key]).to eq('02715')
      expect(@enigma.encrypt('hello world', '02715')[:date]).to eq('111322')
    end

    it '#encrypt can encrypt without a key and date' do
        expect(@enigma.encrypt('hello world')).to be_instance_of(Hash)
    end
  end # end of encrypt describe

  describe '#decrypt' do
    before(:each) do
      @enigma = Enigma.new
    end

    it '#shift_letter_decrypt can change the characters to another for decryption' do
      expect(@enigma.shift_letter_decrypt('keder ohulw', '02715', '040895')).to eq('hello world')
      expect(@enigma.shift_letter_decrypt('keder ohulw!', '02715', '040895')).to eq('hello world!')
    end

    it '#decrypt can decrypt a message' do
      expect(@enigma.decrypt('keder ohulw', '02715', '040895')[:decryption]).to eq('hello world')
      expect(@enigma.decrypt('keder ohulw', '02715', '040895')[:key]).to eq('02715')
      expect(@enigma.decrypt('keder ohulw', '02715', '040895')[:date]).to eq('040895')
      expect(@enigma.decrypt('keder ohulw!', '02715', '040895')[:decryption]).to eq('hello world!')
    end

    it '#decrypt can decrypt without a date' do
      expect(@enigma.decrypt('qkjdxfug rb', '02715')[:decryption]).to eq('hello world')
      expect(@enigma.decrypt('qkjdxfug rb', '02715')[:key]).to eq('02715')
      expect(@enigma.decrypt('qkjdxfug rb', '02715')[:date]).to eq('111322')
    end
  end # end of decrypt describe
end # end of RSpec
