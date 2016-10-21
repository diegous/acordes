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

  test "can return american notation" do
    assert Transposer.call("La", 0, :anglo) == "A"
  end

  test "can transpose american notation" do
    assert Transposer.call("A", 2) == "Si"
  end

  test "can augment all 12 minor notes one tone" do
    original_chords = ["Dom", "Do#m", "Rem", "Re#m", "Mim", "Fam", "Fa#m", "Solm", "Sol#m", "Lam", "La#m", "Sim"]
    expected_chords = ["Rem", "Re#m", "Mim", "Fam", "Fa#m", "Solm", "Sol#m", "Lam", "La#m", "Sim", "Dom", "Do#m"]
    assert expected_chords == Enum.map(original_chords, fn (note) -> Transposer.call(note, 2) end)
  end

  test "can augment all 12 7th notes one tone" do
    original_chords = ["Do7", "Do#7", "Re7", "Re#7", "Mi7", "Fa7", "Fa#7", "Sol7", "Sol#7", "La7", "La#7", "Si7"]
    expected_chords = ["Re7", "Re#7", "Mi7", "Fa7", "Fa#7", "Sol7", "Sol#7", "La7", "La#7", "Si7", "Do7", "Do#7"]
    assert expected_chords == Enum.map(original_chords, fn (note) -> Transposer.call(note, 2) end)
  end

  test "can augment all 12 minor 7th notes one tone" do
    original_chords = ["Dom7", "Do#m7", "Rem7", "Re#m7", "Mim7", "Fam7", "Fa#m7", "Solm7", "Sol#m7", "Lam7", "La#m7", "Sim7"]
    expected_chords = ["Rem7", "Re#m7", "Mim7", "Fam7", "Fa#m7", "Solm7", "Sol#m7", "Lam7", "La#m7", "Sim7", "Dom7", "Do#m7"]
    assert expected_chords == Enum.map(original_chords, fn (note) -> Transposer.call(note, 2) end)
  end

end