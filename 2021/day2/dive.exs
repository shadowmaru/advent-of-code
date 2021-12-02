defmodule Dive do
  def position do
    read_file()
    |> parse_file()
    |> directions()
    |> IO.inspect()
  end

  defp directions(instructions) do
    # [forward: 2, down: 3, forward: 3, up: 1]
    horizontal =
      Enum.reduce(instructions, 0, fn instruction, acc ->
        case Enum.at(instruction, 0) do
          :forward -> acc + Enum.at(instruction, 1)
          _ -> acc
        end
      end)

    depth =
      Enum.reduce(instructions, 0, fn instruction, acc ->
        case Enum.at(instruction, 0) do
          :down -> acc + Enum.at(instruction, 1)
          :up -> acc - Enum.at(instruction, 1)
          _ -> acc
        end
      end)

    {horizontal, depth}
  end

  defp parse_file(file) do
    file
    |> String.split(~r{\n})
    |> Enum.reject(fn x -> x == "" end)
    |> Enum.map(fn direction ->
      x = String.split(direction, ~r{\s})
      [Enum.at(x, 0) |> String.to_atom(), Enum.at(x, 1) |> String.to_integer()]
    end)
  end

  defp read_file() do
    {:ok, file} = File.read("input.txt")
    file
  end
end

Dive.position()
