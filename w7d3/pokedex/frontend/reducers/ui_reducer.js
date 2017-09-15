import { RECEIVE_ONE_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const initialState = {
  pokeDisplay: {},
  errors: {},
  loading: {},
};

const uiReducer = (state = initialState, action) => {
  Object.freeze(state);
  let nextState = {};

  switch(action.type){
    case RECEIVE_ONE_POKEMON:
      Object.assign(nextState, state);
      nextState.pokeDisplay = action.payload.pokemon.id;
      nextState.errors = {};
      nextState.loading = {};
      return merge({}, state, nextState);
    default:
      return state;

  }
};

export default uiReducer;
