require 'simplecov'
SimpleCov.start
require './lib/enigma'
require 'date'

RSpec.describe Enigma do
  it "enigma exists" do
    enigma = Enigma.new

    expect(enigma).to be_instance_of(Enigma)
  end
end