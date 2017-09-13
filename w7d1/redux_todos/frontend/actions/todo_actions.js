import * as APIUtil from '../util/todo_api_util';

export const UPDATE_TODO = 'UPDATE_TODO';
export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';
export const REMOVE_TODO = 'REMOVE_TODO';

// async - thunk action creator
export const requestTodos = () => dispatch => (
  APIUtil.fetchTodos().then(todos => dispatch(receiveTodos(todos)))
);

export const createTodo = (todo) => dispatch => (
  APIUtil.postTodo(todo).then(todos => dispatch(receiveTodo(todos)))
);

export const receiveTodos = (todos) => {
  return{
    type: RECEIVE_TODOS,
    todos
  };
};

export const receiveTodo = (todo) => {
  return{
    type: RECEIVE_TODO,
    todo
  };
};

export const removeTodo = (todo) => {
  return{
    type: REMOVE_TODO,
    todo
  };
};

export const updateTodo = (todo) => {
  return{
    type: UPDATE_TODO,
    todo
  };
};
