require './lib/enigma'
class CommandLine
  attr_reader :input, :output
  def initialize(argv)
    @input = argv[0]
    @output = argv[1]
    
  end
end
