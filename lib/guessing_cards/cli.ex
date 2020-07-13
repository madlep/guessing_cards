defmodule GuessingCards.CLI do
  @spec main(OptionParser.argv()) :: :ok
  def main(argv \\ []) do
    argv
    |> parse_argv()
    |> card_count()
    |> GuessingCards.run()
    |> IO.puts()
  end

  @options [strict: [card_count: :integer]]

  @spec parse_argv(OptionParser.argv()) :: OptionParser.parsed()
  defp parse_argv(argv) do
    {opts, _rest, _errors} = argv |> OptionParser.parse(@options)
    opts
  end

  @default_card_count 6

  @spec card_count(OptionParser.parsed()) :: integer()
  defp card_count(opts) do
    opts |> Keyword.get(:card_count, @default_card_count)
  end
end
