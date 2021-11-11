require './lib/enigma'
RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new("Fuck!", "71929", "111121")
  end
  it 'exists' do

    expect(@enigma).to be_an_instance_of(Enigma)
  end

  it 'encrypt' do
    expected = {
      :message => "Fuck",
      :key => "71929",
      :date => "111121"
    }

    expect(Enigma.encrypt("Fuck", "71929", "111121")).to eq(expected)
  end
end
