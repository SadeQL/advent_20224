defmodule DayOne do
  def run_part_one(file_path) do
    file_path
    |> parse_csv()
    |> calculate_distance()
  end

  def run_part_two(file_path) do
    file_path
    |> parse_csv()
    |> calculate_similatiry()
  end

  def parse_csv(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.reduce({[], []}, fn line, {arr1, arr2} ->
      [col1, col2] = String.split(line, ~r/\s+/, trim: true)

      {arr1 ++ [String.to_integer(col1)], arr2 ++ [String.to_integer(col2)]}
    end)
    |> (fn {arr1, arr2} -> [arr1, arr2] end).()
  end

  @spec calculate_distance([[]]) :: integer
  def calculate_distance([arr1, arr2]) do
    sorted_arr1 = Enum.sort(arr1)
    sorted_arr2 = Enum.sort(arr2)

    sorted_arr1 |> Enum.zip(sorted_arr2) |> Enum.map(fn {a, b} -> abs(b - a) end) |> Enum.sum()
  end

  def calculate_similatiry([arr1, arr2]) do
    arr1
    |> Enum.map(fn elem -> {elem, Enum.count(arr2, fn x -> x == elem end)} end)
    |> Enum.map(fn {a, b} -> a * b end)
    |> Enum.sum()
  end
end
