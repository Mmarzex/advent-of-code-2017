
defmodule DayFour do
  def isValid(passcode) do
    passcode
    |> Enum.uniq
    |> Enum.count != passcode |> Enum.count
  end
  def isAnagram(passcode) do
    temp = passcode
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(&Enum.sort/1)
    Enum.uniq(temp) |> Enum.count != Enum.count(temp)
  end
end

input = File.read!("input")
      |> String.trim
      |> String.split("\n")

input
|> Enum.map(&String.split/1)
|> Enum.map(&DayFour.isValid/1)
|> Enum.filter(&(&1 == false))
|> Enum.count
|> IO.inspect

input
|> Enum.map(&String.split/1)
|> Enum.map(&DayFour.isAnagram/1)
|> Enum.filter(&(&1 == false))
|> Enum.count
|> IO.inspect
