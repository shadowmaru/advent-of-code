defmodule Sonar do
  def increases do
    # IO.inspect(measu1rements, limit: :infinity)
    measurements =
      read_file()
      |> measurements()
      |> Enum.map(fn x -> String.to_integer(x) end)

    measurements
    |> compare()
    |> IO.puts()
  end

  def increases3 do
    measurements =
      read_file()
      |> measurements()

    windows =
      measurements
      |> Enum.with_index()
      |> Enum.map(fn {measurement, index} ->
        [
          Enum.at(measurements, index),
          Enum.at(measurements, index + 1),
          Enum.at(measurements, index + 2)
        ]
      end)
      |> Enum.slice(0..-3)
      |> Enum.map(fn x ->
        Enum.map(x, fn y -> String.to_integer(y) end) |> Enum.sum()
      end)

    windows
    |> compare()
    |> IO.puts()
  end

  defp compare(list) do
    list
    |> Enum.with_index()
    |> Enum.reduce(0, fn {item, index}, acc ->
      if item > Enum.at(list, index - 1) do
        IO.puts("#{item} (increased)")
        1 + acc
      else
        IO.puts("#{item} (decreased)")
        acc
      end
    end)
  end

  defp measurements(file) do
    file
    |> String.split(~r{\n})
    |> Enum.reject(fn x -> x == "" end)
  end

  defp read_file() do
    {:ok, file} = File.read("input.txt")
    file
  end
end

Sonar.increases()
Sonar.increases3()
