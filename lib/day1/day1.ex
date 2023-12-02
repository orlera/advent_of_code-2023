defmodule V2023.Day1 do
  @input_file_part1 "lib/day1/input.txt"
  @input_file_part2 "lib/day1/input.txt"
  def solution_part1() do
    @input_file_part1
    |> parse_input()
    |> Enum.map(&get_calibration_value/1)
    |> Enum.sum()
    |> IO.puts()
  end

  def solution_part2() do
    @input_file_part2
    |> parse_input()
    # |> IO.puts()
  end

  def get_calibration_value(input_line) do
    input_line
    |> first_and_last_digit_in_string
    |> Enum.join()
    |> String.to_integer()
  end

  def first_and_last_digit_in_string(string) do
    string
    |> digits_in_string
    |> first_and_last
  end

  def digits_in_string(string) do
    string
    |> String.graphemes()
    |> Enum.filter(&is_digit/1)
  end

  def is_digit(char), do: char >= "0" && char <= "9"

  def first_and_last(enum), do: [ Enum.at(enum, 0), Enum.at(enum, -1) ]

  def parse_input(input) do
    input
    |> File.read!()
    |> String.split("\n")
  end
end
