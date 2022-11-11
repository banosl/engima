require 'simplecov'
SimpleCov.start
require './lib/enigma'
require 'date'

RSpec.describe Enigma do
  it "enigma exists" do
    enigma = Enigma.new

    expect(enigma).to be_instance_of(Enigma)
  end

  describe "#encrypt" do
    before(:each) do
        enigma = Enigma.new
    end
    
    it 'encrypt takes three arguments and makes a hash' do
        expect(enigma.encrypt("hello world", "02715", "040895")).to be(Hash)
    end
  end
end