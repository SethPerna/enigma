module Decrypt
  def decrypt(message, key, date = today_date)
    decryption = Hash.new(0)
    offset = (date.to_i ** 2).to_s.slice(-4..-1).to_i
    offset_2 = offset.to_s.split(//)
    message_array = message.split(//)
    a_shift = key.slice(0..1).to_i
    b_shift = key.slice(1..2).to_i
    c_shift = key.slice(2..3).to_i
    d_shift = key.slice(3..4).to_i
    decrypted_message = []
    message_array.each_with_index do |char, i|
      char.downcase!
      if i % 4 == 0
        encrypt_1 = @char_set.rotate((a_shift + offset_2[0].to_i) * -1)[@char_set.index(char)] #3
          decrypted_message << encrypt_1
      elsif i % 4 == 1
        encrypt_2 = @char_set.rotate((b_shift + offset_2[1].to_i) * -1)[@char_set.index(char)] #27
          decrypted_message << encrypt_2
      elsif i % 4 == 2
        encrypt_3 = @char_set.rotate((c_shift + offset_2[2].to_i) * -1)[@char_set.index(char)] #73
          decrypted_message << encrypt_3
      elsif i % 4 == 3
        encrypt_4 = @char_set.rotate((d_shift + offset_2[3].to_i) * -1)[@char_set.index(char)] #20
          decrypted_message << encrypt_4
      end
    end
    decrypted_message
    decryption = {
      message: decrypted_message.join,
      key: key,
      date: date
    }
  end
end
