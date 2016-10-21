defmodule Acordes.Transposer do

  @regex  ~r/(?<tone>Do#|Do|Reb|Re#|Re|Mib|Mi|Fa#|Fa|Solb|Sol#|Sol|Lab|La#|La|Sib|Si|C#|C|Db|D#|D|Eb|E|F#|F|Gb|G#|G|Ab|A#|A|Bb|B)(?<mode>m7|m|13|11|9|7|6|)/

  @latin    ["Do", "Do#", "Re", "Re#", "Mi", "Fa", "Fa#", "Sol", "Sol#", "La", "La#", "Si"]
  @american ["C" , "C#" , "D" , "D#" , "E" , "F" , "F#" , "G"  , "G#"  , "A" , "A#" , "B"]

  @notes_positions (Enum.with_index(@latin) ++ Enum.with_index(@american)) |> Enum.into(%{})

  def call(note, semitones) do
    if String.starts_with?(note, @latin) do
      call(note, semitones, :latin)
    else
      call(note, semitones, :american)
    end
  end

  def call(note, semitones, notation) do
    %{"tone" => tone, "mode" => mode} =
      @regex |> Regex.named_captures(note)

    tone
    |> position
    |> augment(semitones)
    |> get_note(notation)
    |> Kernel.<>(mode)
  end

  defp position(note) do
    @notes_positions |> Map.fetch!(note)
  end

  defp augment(position, semitones) do
    rem (position + semitones), 12
  end

  defp get_note(position, :latin) do    
    @latin |> Enum.fetch!(position)
  end

  defp get_note(position, :american) do    
    @american |> Enum.fetch!(position)
  end

end