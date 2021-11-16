require_relative './spec_helper'
require 'date'
require './lib/enigma'
RSpec.describe Enigma do
  let(:enigma) {Enigma.new}

  it 'exists' do
    expect(enigma).to be_an_instance_of(Enigma)
  end

  it 'has #char_set' do
    expect(enigma.char_set.count).to eq(27)
  end

  it "has date" do
    expect(enigma.today_date).to eq("111621")
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
    expected = {message: "ojllkbeh", key: "12345", date: "111621"}
    expect(enigma.encrypt("Whats up", "12345")).to eq(expected)
  end

  it '#decrypt with #today_date' do
    enigma.encrypt("Whats up", "12345")
    expected = {message: "whats up", key: '12345', date: "111621"}
    expect(enigma.decrypt("ojllkbeh", "12345", "111621")).to eq(expected)
  end

  it '#encrypt and ignore special characters' do
    expected = {message: "keder ohulw!", key: "02715", date: "040895"}
    expect(enigma.encrypt("hello world!", "02715", "040895")).to eq(expected)
  end

  it '#decrypt and ignore special characters' do
    expected = {message: "hello world!", key: "02715", date: "040895"}
    expect(enigma.decrypt("keder ohulw!", "02715", "040895")).to eq(expected)
  end

  it '#encrypt with #today_date and #key_generator' do
    #expected = {message: "jibberish", key: '12345', date: "111421"}
    expect(enigma.encrypt("hello world")).to be_an_instance_of(Hash)
  end
end
