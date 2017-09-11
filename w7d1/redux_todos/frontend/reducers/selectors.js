const allTodos = (state) => {
  const todos = [];
  Object.keys(state.todos).forEach(id => {
    //object id starts at 1 but array index starts at 0
    todos.push(state.todos[id]);
  });
  return todos;

};

export default allTodos;
