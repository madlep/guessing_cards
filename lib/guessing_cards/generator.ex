defmodule GuessingCards.Generator do
  @moduledoc false

  use Bitwise

  @spec cards(integer()) :: [GuessingCards.Card.t()]
  def cards(number) do
    max_num = 2 <<< (number - 1)

    0..(number - 1)
    |> Enum.map(&build_card(&1, max_num))
  end

  @spec build_card(integer(), integer()) :: GuessingCards.Card.t()
  defp build_card(card_num, max_num) do
    numbers = 1..max_num
    GuessingCards.Card.build(card_num + 1, card_num, numbers)
  end
end
