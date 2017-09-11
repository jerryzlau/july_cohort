import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import {receiveTodos, receiveTodo } from './actions/todo_actions';

window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;

document.addEventListener("DOMContentLoaded", function(){
  const store = configureStore();
  window.store = store;
  ReactDOM.render(<h1>Todo Apps</h1>, document.getElementById('root'));
});
