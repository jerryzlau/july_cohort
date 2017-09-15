import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import Root from './components/root';
import { HashRouter, Route } from 'react-router-dom';
import {requestOnePokemon, requestAllPokemon, receiveAllPokemon, receiveOnePokemon} from './actions/pokemon_actions';
import {fetchOnePokemon, fetchAllPokemon} from './util/api_util';

window.requestOnePokemon = requestOnePokemon;
window.requestAllPokemon = requestAllPokemon;
window.receiveAllPokemon = receiveAllPokemon;
window.receiveOnePokemon = receiveOnePokemon;
window.fetchAllPokemon = fetchAllPokemon;
window.fetchOnePokemon = fetchOnePokemon;

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  window.store = store;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  ReactDOM.render(<Root store={store}/>, rootEl);
});
