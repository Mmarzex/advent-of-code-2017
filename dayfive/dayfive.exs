
defmodule DayFive do
  def runJumps(instructions, index, count) do
    temp = Enum.at(instructions, index, :none)
    if temp == :none do
      count
    else
      runJumps(List.replace_at(instructions, index, temp + 1), index + temp, count + 1)
    end
  end

  def runJumpsP2(instructions, index, count) do
    IO.inspect count
    temp = Enum.at(instructions, index, :none)
    cond do
      temp == :none ->
        count
      temp >= 3 ->
        runJumpsP2(List.replace_at(instructions, index, temp - 1), index + temp, count + 1)
      true ->
        runJumpsP2(List.replace_at(instructions, index, temp + 1), index + temp, count + 1)
    end
  end

  def runJumpsMap(instructions, index, count) do
    temp = Map.get(instructions, index, :none) 
    cond do
      temp == :none ->
        count
      temp >= 3 ->
        runJumpsMap(put_in(instructions[index], temp - 1), index + temp, count + 1)
      true ->
        runJumpsMap(put_in(instructions[index], temp + 1), index + temp, count + 1)
    end
  end
end

[0, 3, 0, 1, -3]
  |> Enum.with_index
  |> Enum.map(fn {k,v} -> {v,k} end)
  |> Map.new
  |> DayFive.runJumpsMap(0, 0)
  |> IO.inspect

File.read!("input.txt")
        |> String.trim
        |> String.split("\n")
        |> Enum.map(&String.to_integer/1)
        |> Enum.with_index
        |> Enum.map(fn {k,v} -> {v, k} end)
        |> Map.new
        |> DayFive.runJumpsMap(0, 0)
        |> IO.inspect
