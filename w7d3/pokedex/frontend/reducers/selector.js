const selectAllPokemon = (state) => {
  if (state.entities.pokemon === {}) return [];
  return Object.keys(state.entities.pokemon).map(id => {
    //object id starts at 1 but array index starts at 0
    return state.entities.pokemon[id];
  });
};

export default selectAllPokemon;
