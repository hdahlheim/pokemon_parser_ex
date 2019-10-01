defmodule PokemonParser do
  @moduledoc """
  Documentation for PokemonParser.
  """

  def parse(limit \\ 1000) when is_number(limit) and limit > 0 do
    response =
      "https://pokeapi.co/api/v2/pokemon?limit=#{limit}"
      |> HTTPoison.get!()
      |> Map.fetch!(:body)
      |> Jason.decode!()

    Enum.reduce(response["results"], [], fn %{"name" => pokename}, acc ->
      [String.capitalize(pokename) | acc]
    end)
    |> Enum.reverse()
  end
end
