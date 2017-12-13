
defmodule DaySix do
  def countCycles(blocks), do: runCycle(blocks, [], 0)

  defp runCycle(blocks, memory, count) do
    maxVal = Enum.max(blocks)
    maxIndex = Enum.find_index(blocks, &(&1 == maxVal))
    newList = updateBlocks(List.replace_at(blocks, maxIndex, 0), if maxIndex == Enum.count(blocks) - 1 do 0 else maxIndex + 1 end, maxVal)

    if Enum.find(memory, &(&1 == Enum.join(newList))) == nil do
      runCycle(newList, Enum.concat(memory, [Enum.join(newList)]), count + 1)
    else
      count + 1
    end
  end

  defp updateBlocks(blocks, _, count) when count == 0, do: blocks
  defp updateBlocks(blocks, index, count) do
    updateBlocks(List.update_at(blocks, index, &(&1 + 1)), if index == Enum.count(blocks) - 1 do 0 else index + 1end, count-1)
  end
end

File.read!("input.txt")
  |> String.trim
  |> String.split
  |> Enum.map(&String.to_integer/1)
  |> DaySix.countCycles
  |> IO.inspect
[0, 2, 7, 0]
|> DaySix.countCycles
|> IO.inspect
