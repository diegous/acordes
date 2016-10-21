defmodule AcordesTest do
  use ExUnit.Case
  doctest Acordes
  alias Acordes.Transposer

  test "'do' augmented 2 semitones becomes 're'" do
    assert Transposer.call("Do", 2) == "Re"
  end

  test "'re' augmented 2 semitones becomes 'mi'" do
    assert Transposer.call("Re", 2) == "Mi"
  end

  test "'do' augmented 1 semitone becomes 'do#'" do
    assert Transposer.call("Do", 1) == "Do#"
  end

  test "can augment all 12 mayor notes one tone" do
    original_chords = ["Do", "Do#", "Re", "Re#", "Mi", "Fa", "Fa#", "Sol", "Sol#", "La", "La#", "Si"]
    expected_chords = ["Re", "Re#", "Mi", "Fa", "Fa#", "Sol", "Sol#", "La", "La#", "Si", "Do", "Do#"]
    assert expected_chords == Enum.map(original_chords, fn (note) -> Transposer.call(note, 2) end)
  end

  test "can diminish all 12 mayor notes one tone" do
    original_chords = ["Re", "Re#", "Mi", "Fa", "Fa#", "Sol", "Sol#", "La", "La#", "Si", "Do", "Do#"]
    expected_chords = ["Do", "Do#", "Re", "Re#", "Mi", "Fa", "Fa#", "Sol", "Sol#", "La", "La#", "Si"]
    assert expected_chords == Enum.map(original_chords, fn (note) -> Transposer.call(note, -2) end)
  end

  test "only notes can be transposed. Anything else is not_a_note" do
    assert Transposer.call("Not a note", 1) == :not_a_note
  end

  test "can return american notation" do
    assert Transposer.call("La", 0, :american) == "A"
  end

  test "can transpose american notation" do
    assert Transposer.call("A", 2) == "B"
  end

  # test "can augment all 12 minor notes one tone" do
  #   original_chords = ["Dom", "Do#m", "Rem", "Re#m", "Mim", "Fam", "Fa#m", "Solm", "Sol#m", "Lam", "La#m", "Sim"]
  #   expected_chords = ["Rem", "Re#m", "Mim", "Fam", "Fa#m", "Solm", "Sol#m", "Lam", "La#m", "Sim", "Dom", "Do#m"]
  #   assert expected_chords == Enum.map(original_chords, fn (note) -> Transposer.call(note, 2) end)
  # end

end