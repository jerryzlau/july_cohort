json.pokemon do
  json.extract! @pokemon, :id, :name, :attack, :defense, :image_url, :moves, :poke_type
  json.items @pokemon.items
end
