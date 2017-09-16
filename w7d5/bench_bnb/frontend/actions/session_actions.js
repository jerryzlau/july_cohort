import * as APIUtil from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";

const login = (user) => (dispatch) => (
  APIUtil.login(user)
         .then(currentUser => dispatch(receiveCurrentUser(currentUser)))
         .then(currentUser => dispatch(receiveErrors(currentUser)))

);

const signup = (user) => (dispatch) => (
  APIUtil.signup(user)
         .then(currentUser => dispatch(receiveCurrentUser(currentUser)))
         .then(currentUser => dispatch(receiveErrors(currentUser)))
);

const logout = () => (dispatch) => (
  APIUtil.logout()
         .then(currentUser => dispatch(receiveCurrentUser(currentUser)))
         .then(currentUser => dispatch(receiveErrors(currentUser)))
);

const receiveCurrentUser = (currentUser) => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors
});
