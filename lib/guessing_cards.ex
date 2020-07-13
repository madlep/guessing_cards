defmodule GuessingCards do
  @type card() :: [integer()]

  @spec run(integer()) :: String.t()
  def run(card_count) do
    card_count
    |> GuessingCards.Generator.cards()
    |> GuessingCards.Renderer.render()
  end
end
