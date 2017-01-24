# https://www.hackerrank.com/challenges/fp-array-of-n-elements

defmodule STDIO do
    def read, do: read []
    def read(lines) do
      case IO.read(:stdio, :line) do
        :eof -> lines
        {:error, reason} -> IO.puts "Error: #{reason}"
        data ->
          lines = lines ++ [(data |> String.trim_trailing)]
          read lines
      end
    end
end

defmodule Solution do
    def main(n), do: List.duplicate 0,n
end

[n | _] = STDIO.read
n |> String.to_integer |> Solution.main |> IO.inspect
