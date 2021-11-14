require './encrypt'
require './decrypt'
require './key_generator'
require './today_date'
class Enigma
  include Encrypt
  include Decrypt
  include KeyGenerator
  include TodayDate
  attr_reader :message, :key, :date, :char_set
  def initialize
    @char_set = ("a" .. "z").to_a << " "
  end
end
