defmodule Acordes.Transposer do

  @regex  ~r/(?<tone>Do#|Do|Reb|Re#|Re|Mib|Mi|Fa#|Fa|Solb|Sol#|Sol|Lab|La#|La|Sib|Si|C#|C|Db|D#|D|Eb|E|F#|F|Gb|G#|G|Ab|A#|A|Bb|B)(?<mode>m7|m|13|11|9|7|6|)/

  @latin ["Do", "Do#", "Re", "Re#", "Mi", "Fa", "Fa#", "Sol", "Sol#", "La", "La#", "Si"]
  @anglo ["C" , "C#" , "D" , "D#" , "E" , "F" , "F#" , "G"  , "G#"  , "A" , "A#" , "B"]

  @notes_positions (Enum.with_index(@latin) ++ Enum.with_index(@anglo)) |> Enum.into(%{})

  def call(note, semitones, notation \\ :latin) do
    %{"tone" => tone, "mode" => mode} = Regex.named_captures(@regex, note)

    tone
    |> position
    |> augment(semitones)
    |> get_note(notation)
    |> Kernel.<>(mode)
  end

  defp position(note), do: @notes_positions |> Map.fetch!(note)
  defp augment(pos, semitones), do: rem((pos + semitones), 12)
  defp get_note(pos, :latin), do: Enum.fetch!(@latin, pos)
  defp get_note(pos, :anglo), do: Enum.fetch!(@anglo, pos)

end