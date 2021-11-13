class Enigma
  attr_reader :message, :key, :date, :char_set
  def initialize
    @char_set = ("a" .. "z").to_a << " "
  end

  def encrypt(message, key = key_generator, date = today_date)
    encryption = Hash.new(0)
    offset = (date.to_i ** 2).to_s.slice(-4..-1).to_i
    offset_2 = offset.to_s.split(//)#1025
    message_array = message.split(//)
    a_shift = key.slice(0..1).to_i #02
    b_shift = key.slice(1..2).to_i #27
    c_shift = key.slice(2..3).to_i #71
    d_shift = key.slice(3..4).to_i #15
    encrypted_message = []
    message_array.each_with_index do |char, i|
      if i % 4 == 0
        encrypt_1 = @char_set.rotate((a_shift + offset_2[0].to_i))[@char_set.index(char)] #3
          encrypted_message << encrypt_1
      elsif i % 4 == 1
        encrypt_2 = @char_set.rotate((b_shift + offset_2[1].to_i))[@char_set.index(char)] #27
          encrypted_message << encrypt_2
      elsif i % 4 == 2
        encrypt_3 = @char_set.rotate((c_shift + offset_2[2].to_i))[@char_set.index(char)] #73
          encrypted_message << encrypt_3
      elsif i % 4 == 3
        encrypt_4 = @char_set.rotate((d_shift + offset_2[3].to_i))[@char_set.index(char)] #20
          encrypted_message << encrypt_4
      end
    end
    encrypted_message
    encryption = {
      message: encrypted_message.join,
      key: key,
      date: date
    }
  end

  def key_generator
    key = rand(99999).to_s.rjust(5, "0")
  end

  def today_date
    date = Date.today.strftime("%m%d%y")
  end
end
