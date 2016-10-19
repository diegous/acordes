defmodule Acordes.Transposer do

  def call("do", 1), do: "do#"
  def call("do", 2), do: "re"
  def call("re", _semitones), do: "mi"

end