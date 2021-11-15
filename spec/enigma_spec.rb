require 'date'
require './lib/enigma'
require 'spec_helper'
RSpec.describe Enigma do
  let(:enigma) {Enigma.new}

  it 'exists' do
    expect(enigma).to be_an_instance_of(Enigma)
  end

  it 'has #char_set' do
    expect(enigma.char_set.count).to eq(27)
  end

  it "has date" do
    expect(enigma.today_date).to eq("111521")
  end

  it '#encrypt' do
    expected = {message: "keder ohulw", key: "02715", date: "040895"}
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end

  it '#encrypt without argument' do
    expect(enigma.encrypt("My name is Seth")).to be_an(Hash)
  end

  it 'can #decrypt' do
    expected = {message: "hello world", key: "02715", date: "040895"}
    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
  end

  it '#encrypt with #today_date' do
    expected = {message: "khllg eh", key: "12345", date: "111521"}
    expect(enigma.encrypt("Whats up", "12345")).to eq(expected)
  end

  it '#decrypt with #today_date' do
    enigma.encrypt("Whats up", "12345")
    expected = {message: "whats up", key: '12345', date: "111521"}
    expect(enigma.decrypt("khllg eh", "12345", "111521")).to eq(expected)
  end

  it '#encrypt and ignore special characters' do
    expected = {message: "keder ohulw!", key: "02715", date: "040895"}
    expect(enigma.encrypt("hello world!", "02715", "040895")).to eq(expected)
  end

  xit '#encrypt with #today_date and #key_generator' do
    expected = {message: "jibberish", key: '12345', date: "111421"}
    expect(enigma.encrypt("hello world")).to eq(expected)
  end
end
