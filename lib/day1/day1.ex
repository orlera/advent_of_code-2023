defmodule V2023.Day1 do
  @input_file_part1 "lib/day1/input.txt"
  @input_file_part2 "lib/day1/input.txt"

  @literals %{ "zero" => "0",
                "one" => "1",
                "two" => "2",
                "three" => "3",
                "four" => "4",
                "five" => "5",
                "six" => "6",
                "seven" => "7",
                "eight" => "8",
                "nine" => "9",
                "0" => "0",
                "1" => "1",
                "2" => "2",
                "3" => "3",
                "4" => "4",
                "5" => "5",
                "6" => "6",
                "7" => "7",
                "8" => "8",
                "9" => "9" }

  def solution_part1() do
    @input_file_part1
    |> parse_input()
    |> Enum.map(&get_calibration_value_p1/1)
    |> Enum.sum()
    |> IO.puts()
  end

  def solution_part2() do
    @input_file_part2
    |> parse_input()
    |> Enum.map(&get_calibration_value_p2/1)
    |> Enum.sum()
    |> IO.puts()
  end

  def get_calibration_value_p1(input_line) do
    input_line
    |> first_and_last_digit_in_string()
    |> Enum.join()
    |> String.to_integer()
  end

  def first_and_last_digit_in_string(string) do
    string
    |> digits_in_string()
    |> first_and_last()
  end

  def digits_in_string(string) do
    string
    |> String.graphemes()
    |> Enum.filter(&is_digit/1)
  end

  def is_digit(char), do: char >= "0" && char <= "9"

  def first_and_last(enum), do: [ Enum.at(enum, 0), Enum.at(enum, -1) ]

  def get_calibration_value_p2(string) do
    graphemes = String.graphemes(string)

    first =
      graphemes
      |> get_first()

    last =
      graphemes
      |> Enum.reverse()
      |> get_first(true)

    first <> last
    |> String.to_integer()
  end

  def get_first([head | rest], last \\ false) do
    key = Map.keys(@literals) |> Enum.filter(&String.contains?(head, &1))

    case rest do
      [] -> Map.get(@literals, Enum.at(key, 0))
      [next | rest] ->
        case key do
          [] ->
            new_head = if last, do: next <> head, else: head <> next
            get_first([new_head | rest], last)
          [key] -> Map.get(@literals, key)
        end
      end
  end

  def parse_input(input) do
    input
    |> File.read!()
    |> String.split("\n")
  end
end
