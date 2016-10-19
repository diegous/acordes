defmodule Acordes.Transposer do

  def call(note, semitones) do
    note
    |> pos
    |> augment(semitones)
    |> get_note
  end

  defp pos(  "Do"), do:  0
  defp pos( "Do#"), do:  1
  defp pos(  "Re"), do:  2
  defp pos( "Re#"), do:  3
  defp pos(  "Mi"), do:  4
  defp pos(  "Fa"), do:  5
  defp pos( "Fa#"), do:  6
  defp pos( "Sol"), do:  7
  defp pos("Sol#"), do:  8
  defp pos(  "La"), do:  9
  defp pos( "La#"), do: 10
  defp pos(  "Si"), do: 11

  defp augment(position, semitones) do
    rem (position + semitones), 12
  end

  defp get_note(position) do
    {:ok, note} = ["Do", "Do#", "Re", "Re#", "Mi", "Fa", "Fa#", "Sol", "Sol#", "La", "La#", "Si"]
    |> Enum.fetch(position)
    note
  end

end