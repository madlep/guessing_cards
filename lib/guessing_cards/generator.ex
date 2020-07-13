defmodule GuessingCards.Generator do
  @moduledoc false

  use Bitwise

  @spec cards(integer()) :: [GuessingCards.card()]
  def cards(number) do
    max_num = 2 <<< (number - 1)

    0..(number - 1)
    |> Enum.map(&build_card(&1, max_num))
  end

  @spec build_card(integer(), integer()) :: GuessingCards.card()
  defp build_card(card_num, max_num) do
    1..max_num |> Enum.filter(&number_on_card?(&1, card_num))
  end

  @spec number_on_card?(integer(), integer()) :: boolean()
  defp number_on_card?(n, card_num) do
    bit_test = 2 <<< (card_num - 1)
    (n &&& bit_test) != 0
  end
end
