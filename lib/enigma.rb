class Enigma
  attr_reader :message, :key, :date
  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def self.encrypt(message, key, date)
    {
      :message => @message,
      :key => @key,
      :date => @date
    }
  end
end
