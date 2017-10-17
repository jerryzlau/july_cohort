import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store.js';
// import * as APIUtil from './util/session_api_util';
import {login, logout, signup} from './actions/session_actions';

// window.signup = APIUtil.signup;
// window.login = APIUtil.login;
// window.logout = APIUtil.logout;
window.signup = signup;
window.login = login;
window.logout = logout;

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  const store = configureStore();
  window.store = store;
  window.getState = store.getState;
  // window.dispatch = store.dispatch;
  ReactDOM.render(<Root store={store} />, root);
});
