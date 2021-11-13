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

    expect(@enigma.today_date).to eq("111221")
  end

  it '#encrypt' do
    expected = {message: "keder ohulw", key: "02715", date: "040895"}

    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end

  it '#encrypt without argument' do

    expect(@enigma.encrypt("aghahjkdgjhsaf")).to eq(Hash)
  end

end
