import { RECEIVE_TODOS, RECEIVE_TODO } from '../actions/todo_actions';
import {merge} from 'lodash/merge';

const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state); //throw error if attempt to change initial state
  switch(action.type) {
    case RECEIVE_TODOS:
      const newTodosState = {};
      action.todos.map(todo => {
        newTodosState[todo.id] = todo;
      });
      return newTodosState;
    case RECEIVE_TODO:
      const newTodoState = {};
      Object.assign(newTodoState, state);
      newTodoState[action.todo.id] = action.todo;
      return newTodoState;
    default:
      return state;
  }
};

export default todosReducer;
