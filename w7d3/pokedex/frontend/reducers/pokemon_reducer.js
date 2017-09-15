import { RECEIVE_ALL_POKEMON, RECEIVE_ONE_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

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
    case RECEIVE_ONE_POKEMON:
      nextState = {[action.payload.pokemon.id]: action.payload.pokemon};
      return merge({}, state, nextState);
    default:
      return state;

  }
};

export default pokemonReducer;
