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
  @hello "Hello World"
  def greet, do: IO.puts(@hello)
end

STDIO.read
Solution.greet
