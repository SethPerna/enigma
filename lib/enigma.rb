class Enigma
  attr_reader :message, :key, :date, :char_set
  def initialize
    @char_set = ("a" .. "z").to_a << " "
  end

  def encrypt(message, key, date)
    key = rand(99999).to_s.rjust(5, "0")
    a_shift = key.slice(0..1).to_i
    b_shift = key.slice(1..2).to_i
    c_shift = key.slice(2..3).to_i
    d_shift = key.slice(3..4).to_i

    require "pry"; binding.pry
  end
end
