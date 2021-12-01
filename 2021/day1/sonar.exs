defmodule Sonar do
  def increases do
    # IO.inspect(measu1rements, limit: :infinity)
    measurements =
      read_file()
      |> measurements()
      |> Enum.map(fn x -> String.to_integer(x) end)

    measurements
    |> Enum.with_index()
    |> Enum.reduce(0, fn {measurement, index}, acc ->
      if measurement > Enum.at(measurements, index - 1) do
        IO.puts("#{measurement} (increased)")
        1 + acc
      else
        IO.puts("#{measurement} (decreased)")
        acc
      end
    end)
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
    |> Enum.with_index()
    |> Enum.reduce(0, fn {window, index}, acc ->
      if window > Enum.at(windows, index - 1) do
        IO.puts("#{window} (increased)")
        1 + acc
      else
        IO.puts("#{window} (decreased)")
        acc
      end
    end)
    |> IO.puts()
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
