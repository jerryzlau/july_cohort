import {RECEIVE_CURRENT_USER
        , RECEIVE_SESSION_ERRORS} from '../actions/session_actions';
import merge from 'lodash/merge';

// const initialState = {
//   "session": []
// };

const SessionErrorsReducer = (state = [], action) => {
  Object.freeze(state);
  switch(action.type){
    case RECEIVE_SESSION_ERRORS:
      return merge({}, state, {["session"]: action.errors});
    case RECEIVE_CURRENT_USER:
      return merge({}, state, {["session"]: []});
    default:
      return state;
  }
};

export default SessionErrorsReducer;
