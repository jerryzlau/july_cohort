import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState;

  switch(action.type){
    case RECEIVE_ALL_POKEMON:
      nextState = {};
      Object.keys(action.pokemon).forEach(idx => {
        nextState[idx] = action.pokemon[idx];
      });
      return nextState;
    default:
      return state;

  }
};

export default pokemonReducer;
