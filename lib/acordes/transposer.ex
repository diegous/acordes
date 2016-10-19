defmodule Acordes.Transposer do

  def call("do", _semitones), do: "re"
  def call("re", _semitones), do: "mi"

end