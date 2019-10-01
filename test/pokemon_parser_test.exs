defmodule PokemonParserTest do
  use ExUnit.Case
  doctest PokemonParser

  test "greets the world" do
    assert PokemonParser.hello() == :world
  end
end
