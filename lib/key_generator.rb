module KeyGenerator
  def key_generator
    key = rand(99999).to_s.rjust(5, "0")
  end
end
