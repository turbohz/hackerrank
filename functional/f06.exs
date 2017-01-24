require Integer
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
  def collect([]), do: []
  def collect(input), do: collect(input, [])
  def collect(input, output) do
    case input do
      [] -> output
      [_] -> output
      [_ | [a]] -> collect [], output ++ [a]
      [_ | [a | xs]] -> collect xs, output ++ [a]
    end
  end
end

xs = STDIO.read
Solution.collect(xs) |> Enum.each(&IO.puts/1)
