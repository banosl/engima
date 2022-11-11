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
      expect(@enigma.encrypt('hello world', '02715', '040895')[:encryption]).to eq('hello world')
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
      expect(@enigma.build_key('02715')).to be_instance_of(Hash)
      expect(@enigma.build_key('02715')).to eq({ a: '02', b: '27', c: '71', d: '15' })
      expect(@enigma.build_key[:a].length).to eq(2)
    end

    it '#build_offset can create A,B,C, and D offsets from the date' do
      expect(@enigma.build_offset('040895')).to be_instance_of(Hash)
      expect(@enigma.build_offset('040895')).to eq({ a: '1', b: '0', c: '2', d: '5' })
      expect(@enigma.build_offset[:a].length).to eq(1)
    end

    it '#key_plus_offset' do
      keys = @enigma.build_key('02715')
      offsets = @enigma.build_offset('040895')

      expect(@enigma.key_plus_offset(keys, offsets)).to be_instance_of(Hash)
      expect(@enigma.key_plus_offset(keys, offsets)).to eq({ a: 3, b: 27, c: 73, d: 20 })

      keys = @enigma.build_key
      offsets = @enigma.build_offset

      expect(@enigma.key_plus_offset(keys, offsets)).to be_instance_of(Hash)
    end
  end
end
