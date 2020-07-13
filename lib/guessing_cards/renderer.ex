defmodule GuessingCards.Renderer do
  @moduledoc false

  @spec render([GuessingCards.card()]) :: String.t()
  def render(cards) do
    cards
    |> Enum.with_index()
    |> Enum.map(&render_card/1)
    |> IO.iodata_to_binary()
  end

  @cards_per_row 6

  @spec render_card({GuessingCards.card(), integer()}, integer()) :: iodata()
  defp render_card({card, card_num}, cards_per_row \\ @cards_per_row) do
    [
      ["---\n"],
      ["Card:", (card_num + 1) |> to_string(), "\n"],
      card
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
