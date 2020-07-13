defmodule GuessingCards.Card do
  use Bitwise

  @moduledoc false

  @type t() :: %__MODULE__{id: pos_integer(), bit: pos_integer(), numbers: [pos_integer()]}
  defstruct id: nil, bit: nil, numbers: []

  @spec build(pos_integer(), pos_integer(), Enum.t()) :: t()
  def build(id, bit, possible_numbers) do
    %__MODULE__{id: id, bit: bit}
    |> set_numbers(possible_numbers)
  end

  @spec set_numbers(t(), Enum.t()) :: t()
  def set_numbers(card, numbers) do
    %__MODULE__{card | numbers: Enum.filter(numbers, &includes?(card, &1))}
  end

  @spec includes?(t(), integer()) :: boolean()
  def includes?(%__MODULE__{bit: bit}, n) do
    bit_test = 2 <<< (bit - 1)
    (n &&& bit_test) != 0
  end
end
