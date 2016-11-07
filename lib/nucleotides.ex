defmodule Nucleotides do
  @base_counts %{a: 0, c: 0, g: 0, t: 0}

  def solve(dna) do
    dna
    |> parse
    |> print
  end

  def print(%{a: a, c: c, g: g, t: t}) do
    puts "#{a} #{c} #{g} #{t}"
  end
  def print(_anything), do: puts "Invalid"

  def parse(dna) do
    dna
    |> String.to_charlist
    |> do_parse(@base_counts)
  end
  defp do_parse([head | tail], counts) do
    do_parse(tail, increment(<<head>>, counts))
  end
  defp do_parse([], counts), do: counts

  defp increment(character, %{a: a, c: c, g: g, t: t} = counts) do
    Map.merge(counts, case character do
      "A" -> %{a: a + 1}
      "C" -> %{c: c + 1}
      "G" -> %{g: g + 1}
      "T" -> %{t: t + 1}
      :else -> %{}
    end)
  end

  defp puts(string), do: IO.puts string
end
