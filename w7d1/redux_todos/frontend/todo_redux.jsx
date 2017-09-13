import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import {receiveTodos, receiveTodo, requestTodos, createTodo } from './actions/todo_actions';
import Root from './components/root.jsx';
import allTodos from './reducers/selectors.js';
import {fetchTodos, postTodo} from './util/todo_api_util';


window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;
window.allTodos = allTodos;
window.fetchTodos = fetchTodos;
window.requestTodos = requestTodos;
window.createTodo = createTodo;
window.postTodo = postTodo;

document.addEventListener("DOMContentLoaded", function(){
  const rootElement = document.getElementById('root');
  const store = configureStore();
  window.store = store;
  ReactDOM.render(<Root store={store} />, rootElement);
});
