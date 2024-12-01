defmodule DayOneTest do
  use ExUnit.Case

  # @tag :pending
  test "calculate distance" do
    input = [[1, 2, 3], [3, 4, 5]]
    assert DayOne.calculate_distance(input) == 6
  end

  test "calculate similarity" do
    input = [[1, 2, 3], [3, 1, 1]]
    assert DayOne.calculate_similatiry(input) == 5
  end
end
