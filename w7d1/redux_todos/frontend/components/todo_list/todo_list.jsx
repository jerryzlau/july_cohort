import React from 'react';
import TodoListItem from './todo_list_items';
import TodoForm from './todo_form';

const TodoList = ({todos, receiveTodo}) => {
  const todoListItems = todos.map(todo => (
    <div key={todo.id}>
        <TodoListItem todo={todo} />
    </div>
  ));

  return (
    <div className="list">
      <ul className="todo-list">
          {todoListItems}
      </ul>
      <TodoForm action={receiveTodo} />
    </div>
  );
};

export default TodoList;
