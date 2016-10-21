defmodule Acordes.Transposer do

  @notes    ["Do", "Do#", "Re", "Re#", "Mi", "Fa", "Fa#", "Sol", "Sol#", "La", "La#", "Si"]
  @american ["C" , "C#" , "D" , "D#" , "E" , "F" , "F#" , "G"  , "G#"  , "A" , "A#" , "B"]

  @notes_positions (Enum.with_index(@notes) ++ Enum.with_index(@american)) |> Enum.into(%{})

  def call(note, semitones) do
    if Enum.member?(@american, note) do
      call(note, semitones, :american)
    else
      call(note, semitones, :latin)
    end
  end

  def call(note, semitones, notation) do
    if Enum.member?((@notes ++ @american), note) do
      note
      |> position
      |> augment(semitones)
      |> get_note(notation)
    else
      :not_a_note
    end
  end

  defp position(note) do
    @notes_positions |> Map.fetch!(note)
  end

  defp augment(position, semitones) do
    rem (position + semitones), 12
  end

  defp get_note(position, :latin) do    
    {:ok, note} = @notes |> Enum.fetch(position)
    note
  end

  defp get_note(position, :american) do    
    {:ok, note} = @american |> Enum.fetch(position)
    note
  end

end