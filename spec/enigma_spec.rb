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
      expect(@enigma.encrypt('hello world', '02715')[:date]).to eq(Date.today.strftime("%m%d%y")) 
    end

    it '#encrypt when no key is given, generates a random one' do
      expect(@enigma.encrypt('hello world')[:key].length).to eq(5)
    end
  end
end
