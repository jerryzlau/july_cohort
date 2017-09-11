const allTodos = (state) => {
  return Object.keys(state.todos).map(id => {
    //object id starts at 1 but array index starts at 0
    return state.todos[id];
  });

};

export default allTodos;
