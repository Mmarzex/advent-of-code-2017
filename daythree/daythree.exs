defmodule DayThree do

  defp calculate(num, steps, len, corner) when num >= corner, do: (steps*2 - len/8 + abs(corner + len/8 - num))
  defp calculate(num, steps, len, corner) do
    calculate(num, steps, len, corner - len/4)
  end
  def findDistance(num, steps, len, corner) when corner >= num, do: calculate(num, steps, len, corner)
  def findDistance(num, steps, _, corner) do
    findDistance(num, steps+1, :math.pow((steps*2+1), 2) - corner, :math.pow((steps*2+1), 2))
  end
end

IO.inspect DayThree.findDistance(347991, 0, 1, 1)
