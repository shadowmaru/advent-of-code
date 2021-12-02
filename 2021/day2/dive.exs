defmodule Dive do
  def position do
    read_file()
    |> parse_file()
    |> directions()
    |> result()
    |> IO.inspect()
  end

  def position_with_aim() do
    read_file()
    |> parse_file()
    |> directions_with_aim()
    |> result()
    |> IO.inspect()
  end

  defp directions(instructions) do
    Enum.reduce(instructions, {0, 0}, fn instruction, {horizontal, depth} ->
      case instruction do
        {:forward, amount} ->
          {horizontal + amount, depth}

        {:down, amount} ->
          {horizontal, depth + amount}

        {:up, amount} ->
          {horizontal, depth - amount}
      end
    end)
  end

  defp result({horizontal, depth}), do: horizontal * depth
  defp result({horizontal, depth, _aim}), do: horizontal * depth

  defp directions_with_aim(instructions) do
    Enum.reduce(instructions, {0, 0, 0}, fn instruction, {horizontal, depth, aim} ->
      case instruction do
        {:forward, amount} ->
          {horizontal + amount, depth + aim * amount, aim}

        {:down, amount} ->
          {horizontal, depth, aim + amount}

        {:up, amount} ->
          {horizontal, depth, aim - amount}
      end
    end)
  end

  defp parse_file(file) do
    file
    |> String.split(~r{\n})
    |> Enum.reject(fn x -> x == "" end)
    |> Enum.map(fn direction ->
      x = String.split(direction, ~r{\s})
      {Enum.at(x, 0) |> String.to_atom(), Enum.at(x, 1) |> String.to_integer()}
    end)
  end

  defp read_file() do
    {:ok, file} = File.read("input.txt")
    file
  end
end

Dive.position()
Dive.position_with_aim()
