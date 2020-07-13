defmodule GuessingCardsTest do
  use ExUnit.Case
  doctest GuessingCards

  test "greets the world" do
    assert GuessingCards.hello() == :world
  end
end
