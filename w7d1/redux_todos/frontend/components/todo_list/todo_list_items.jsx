import React from 'react';

const TodoListItem = ({ todo }) => (
  <div className="todo-item">
    <h3>
      {todo.title}
    </h3>
    <span>
      {todo.body}
    </span>
  </div>
);



export default TodoListItem;
