import { connect } from 'react-redux';
import {receiveTodos, receiveTodo, removeTodo, updateTodo, requestTodos, createTodo } from '../../actions/todo_actions';
import allTodos from '../../reducers/selectors';
import TodoList from './todo_list'; // presentational component to connect

const mapStateToProps = state => ({
  todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
  createTodo: (todo) => dispatch(createTodo(todo)),
  removeTodo: (todo) => dispatch(removeTodo(todo)),
  updateTodo: (todo) => dispatch(updateTodo(todo)),
  requestTodos: () => dispatch(requestTodos())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
