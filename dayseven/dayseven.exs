
defmodule DaySeven do
  def parseInput(input) do
    Enum.reduce(input, %{}, fn(v, acc) ->
      key = v
            |> Enum.at(0)
            |> String.split(" ")
            |> Enum.at(0)
      cond do 
        Enum.count(v) > 1 ->
          Map.put(acc, key, v |> Enum.at(1) |> String.trim |> String.split(", "))
        true ->
          Map.put(acc, key, [])
      end
    end)
  end

  defp isNotChild?(key, values) do
    temp = Enum.filter(values, fn(v) ->
      x = Enum.find(v, &(&1 == key))
      x != nil
    end)
    Enum.count(temp) == 0
  end
  def findLowestNode(input) do
    nodesWithChildren = Enum.filter(input, fn({k, v}) ->
      Enum.count(v) > 0
    end) |> Enum.into(%{})

    nodesWithChildren
    |> Map.keys
    |> Enum.find(fn(x) ->
      isNotChild?(x, Map.values(nodesWithChildren))
    end)
  end
end
File.read!("input.txt")
|> String.trim
|> String.split("\n")
|> Enum.map(fn(x) -> String.split(x, "->") end)
|> DaySeven.parseInput
|> IO.inspect
|> DaySeven.findLowestNode
|> IO.inspect
