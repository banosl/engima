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

    it 'encrypt takes three arguments and makes a hash' do
      expect(@enigma.encrypt('hello world', '02715', '040895')).to be_instance_of(Hash)
    end
  end
end
