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

[n|xs] = STDIO.read
max = n |> String.to_integer
xs = xs |> Enum.map(&String.to_integer/1)
xs |> Enum.filter(fn(x)-> x < max end) |> Enum.each(&IO.puts/1)
