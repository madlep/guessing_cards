defmodule GuessingCards.Renderer do
  @moduledoc false

  @spec render([GuessingCards.Card.t()]) :: String.t()
  def render(cards) do
    cards
    |> Enum.map(&render_card/1)
    |> IO.iodata_to_binary()
  end

  @cards_per_row 6

  @spec render_card(GuessingCards.Card.t(), integer()) :: iodata()
  defp render_card(%GuessingCards.Card{id: id, numbers: numbers}, cards_per_row \\ @cards_per_row) do
    [
      ["---\n"],
      ["Card:", id |> to_string(), "\n"],
      numbers
      |> Enum.chunk_every(cards_per_row)
      |> Enum.map(&render_row/1),
      "\n\n"
    ]
  end

  @spec render_row([integer()]) :: iodata()
  defp render_row(numbers) do
    [
      numbers
      |> Enum.map(&to_string/1)
      |> Enum.map(&String.pad_leading(&1, 5)),
      "\n"
    ]
  end
end
