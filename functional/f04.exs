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
  def collect(n, input), do: collect(n,input, [])
  def collect(n, input, output) do
    case input do
      [x | []] -> output ++ List.duplicate(x,n)
      [x | xs ] -> collect n, xs, output ++ List.duplicate(x,n)
    end
  end
end

[n|xs] = STDIO.read
n = n |> String.to_integer
xs = xs |> Enum.map(&String.to_integer/1)
Solution.collect(n,xs) |> Enum.each(&IO.puts/1)
