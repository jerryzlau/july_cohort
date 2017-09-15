import { RECEIVE_ONE_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const itemsReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState;

  switch(action.type){
    case RECEIVE_ONE_POKEMON:
      return merge({}, state, action.payload.items);
    default:
      return state;

  }
};

export default itemsReducer;
