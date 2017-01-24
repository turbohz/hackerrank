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
    def compute(input) do
      input
      |> Enum.map(&String.to_integer/1)
      |> Enum.sum
    end
end

result = Solution.compute(STDIO.read)
IO.puts result
