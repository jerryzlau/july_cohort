export const fetchAllPokemon = () => (
  $.ajax({
    method: 'GET',
    url: '/api/pokemon/index'
  })
);

export const fetchOnePokemon = (pokemonId) => (
  $.ajax({
    method: 'GET',
    url: `/api/pokemon/${pokemonId}` //fetching from pokemon show page 
  })
);
