import React from 'react';
import ReactDOM from 'react-dom';
import {fetchAllPokemon} from './util/api_util';

window.fetchAllPokemon = fetchAllPokemon;

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  ReactDOM.render(<h1>Pokedex</h1>, rootEl);
});
