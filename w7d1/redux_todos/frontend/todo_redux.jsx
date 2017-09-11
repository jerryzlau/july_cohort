import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import {receiveTodos, receiveTodo } from './actions/todo_actions';
import Root from './components/root.jsx';
import allTodos from './reducers/selectors.js';

window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;
window.allTodos = allTodos;

document.addEventListener("DOMContentLoaded", function(){
  const rootElement = document.getElementById('root');
  const store = configureStore();
  window.store = store;
  ReactDOM.render(<Root store={store} />, rootElement);
});
