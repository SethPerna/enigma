require 'date'
require './lib/enigma'
require 'spec_helper'

RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new
  end
  it 'exists' do

    expect(@enigma).to be_an_instance_of(Enigma)
  end

  it 'has #char_set' do

    expect(@enigma.char_set.count).to eq(27)
  end

  it "has date" do

    expect(@enigma.today_date).to eq("111321")
  end

  it '#encrypt' do
    expected = {message: "keder ohulw", key: "02715", date: "040895"}

    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end

  xit '#encrypt without argument' do

    expect(@enigma.encrypt("My name is Seth")).to eq(Hash)
  end

  it 'can #decrypt' do
    expected = {message: "hello world", key: "02715", date: "040895"}

    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
  end

  it '#encrypt with #today_date' do
    expected = {message: "mdlliweh", key: "12345", date: "111321"}

    expect(@enigma.encrypt("Whats up", "12345")).to eq(expected)
  end

  it '#decrypt with #today_date' do
    @enigma.encrypt("Whats up", "02715")
    expected = {message: "a", key: '02715', date: "111321"}

    expect(@enigma.decrypt(decryption[:message], "02715")).to eq(expected)
  end



end
