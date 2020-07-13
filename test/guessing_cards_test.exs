defmodule GuessingCardsTest do
  @moduledoc false

  use ExUnit.Case
  doctest GuessingCards

  test "generates cards" do
    expected = """
    ---
    Card:1
        1    3    5    7    9   11
       13   15


    ---
    Card:2
        2    3    6    7   10   11
       14   15


    ---
    Card:3
        4    5    6    7   12   13
       14   15


    ---
    Card:4
        8    9   10   11   12   13
       14   15


    """

    assert GuessingCards.run(4) == expected
  end
end
