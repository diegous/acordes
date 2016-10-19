defmodule AcordesTest do
  use ExUnit.Case
  doctest Acordes

  test "'do' augmented 2 semitones becomes 're'" do
    assert Acordes.Transposer.call("do", 2) == "re"
  end
end
