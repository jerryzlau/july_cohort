import React from 'react';
import TodoListItem from './todo_list_items';

const TodoList = ({todos, receiveTodo}) => {
  const todoListItems = todos.map(todo => (
    <li key={todo.id}><TodoListItem todo={todo} /></li>
  ));

  return (
    <div className="list">
      <ul className="todo-list">
        {todoListItems}
      </ul>
    </div>
  );
};

export default TodoList;
