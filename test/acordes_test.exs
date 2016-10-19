defmodule AcordesTest do
  use ExUnit.Case
  doctest Acordes
  alias Acordes.Transposer

  test "'do' augmented 2 semitones becomes 're'" do
    assert Transposer.call("do", 2) == "re"
  end

  test "'re' augmented 2 semitones becomes 'mi'" do
    assert Transposer.call("re", 2) == "mi"
  end

  test "'do' augmented 1 semitone becomes 'do#'" do
    assert Transposer.call("do", 1) == "do#"  
  end

#   it "transposes all 12 mayor notes one tone higher" do
#      transposer = ChordTransposer::Transposer.new(2)
#      original_chords = ['Do', 'Do#', 'Re', 'Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si']
#      expected_chords = ['Re', 'Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si', 'Do', 'Do#']
#      (0..11).each do |index|
#        expect(transposer.call(original_chords[index])).to eq(expected_chords[index])
#      end
#    end
#
#    it "transposes all 12 mayor notes three semitones higher" do
#      transposer = ChordTransposer::Transposer.new(3)
#      original_chords = ['Do', 'Do#', 'Re', 'Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si']
#      expected_chords = ['Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si', 'Do', 'Do#', 'Re']
#      (0..11).each do |index|
#        expect(transposer.call(original_chords[index])).to eq(expected_chords[index])
#      end
#    end
#
#    it "transposes all 12 mayor notes twelve semitones higher (and leaves them exactly the same)" do
#      transposer = ChordTransposer::Transposer.new(12)
#      original_chords = ['Do', 'Do#', 'Re', 'Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si']
#      expected_chords = ['Do', 'Do#', 'Re', 'Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si']
#      (0..11).each do |index|
#        expect(transposer.call(original_chords[index])).to eq(expected_chords[index])
#      end
#    end
#
#    it "transposes all 12 mayor notes 5 semitones lower" do
#      transposer = ChordTransposer::Transposer.new(-5)
#      original_chords = ['Do', 'Do#', 'Re', 'Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si']
#      expected_chords = ['Sol', 'Sol#', 'La', 'La#', 'Si', 'Do', 'Do#', 'Re', 'Re#', 'Mi', 'Fa', 'Fa#']
#      (0..11).each do |index|
#        expect(transposer.call(original_chords[index])).to eq(expected_chords[index])
#      end
#    end
end
