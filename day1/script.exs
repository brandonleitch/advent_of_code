#!/usr/bin/env elixir

defmodule DepthScan do
  def scan(lst) when is_list(lst) do
    lst
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.map(fn [n, m] -> m - n end)
    |> Enum.count(&(&1 > 0))
  end

  def superscan(lst) when is_list(lst) do
    lst
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(&Enum.sum/1)
    |> DepthScan.scan()
  end
end

defmodule Main do
  def part1() do
    System.argv()
    |> hd()
    |> File.read!()
    |> String.split()
    |> Enum.map(&String.to_integer/1)
    |> DepthScan.scan()
    |> IO.puts()
  end

  def part2() do
    System.argv()
    |> hd()
    |> File.read!()
    |> String.split()
    |> Enum.map(&String.to_integer/1)
    |> DepthScan.superscan()
    |> IO.puts()
  end
end

Main.part2()
