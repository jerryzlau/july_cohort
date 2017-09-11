import React from 'react';

const TodoList = ({todos, receiveTodo}) => {
  const todoListItems = todos.map((todo, idx) => (
    <TodoListItem key={idx} todo={todo} />
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
