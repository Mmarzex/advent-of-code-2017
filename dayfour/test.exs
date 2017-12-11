defmodule Day4 do
  def has_dups?(str) do
    coll = String.split(str)
    Enum.uniq(coll) |> Enum.count != coll |> Enum.count
  end

  def has_anagram?(str) do
    sorted = String.split(str)
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(&Enum.sort/1)

    Enum.uniq(sorted) |> Enum.count != Enum.count(sorted)
  end

  def count_valid(inp) do
    Enum.filter(inp, fn(x) -> not has_dups?(x) end)
    |> Enum.count
  end

  def count_noana(inp) do
    Enum.filter(inp, fn(x) -> not has_anagram?(x) end)
    |> Enum.count
  end
end

inp = File.read!("input")
|> String.strip
|> String.split("\n")

Day4.count_valid(inp)
|> IO.puts

Day4.count_noana(inp)
|> IO.puts
