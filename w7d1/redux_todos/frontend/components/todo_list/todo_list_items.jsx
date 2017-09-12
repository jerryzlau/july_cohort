import React from 'react';

class TodoListItem extends React.Component{
  constructor(props){
    super(props);

    this.handleRemove = this.handleRemove.bind(this);
    this.toggle = this.toggle.bind(this);
  }

  handleRemove(e){
    e.preventDefault();
    this.props.removeTodo(this.props.todo);
  }

  toggle(e){
    e.preventDefault();
    this.props.todo.done = !this.props.todo.done;
    this.props.updateTodo(this.props.todo);
  }

  render(){
    return(
      <div className="todo-item">
        <h3>
          {this.props.todo.title}
        </h3>

        <span>
          {this.props.todo.body}
        </span>

        <button onClick={this.toggle}>{this.props.todo.done ? "Undo" : "Done"}</button>

        <button onClick={this.handleRemove}>
          Delete Todo
        </button>
      </div>
    );
  }
}

// const TodoListItem = ({ todo, removeTodo }) => (
//
//
//   <div className="todo-item">
//     <h3>
//       {todo.title}
//     </h3>
//     <span>
//       {todo.body}
//     </span>
//
//     <button onClick={removeTodo(todo)}>Delete Todo</button>
//   </div>
// );



export default TodoListItem;
