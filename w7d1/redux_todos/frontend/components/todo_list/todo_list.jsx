import React from 'react';
import TodoListItem from './todo_list_items';
import TodoForm from './todo_form';

class TodoList extends React.Component{
  constructor(props){
    super(props);
    // debugger
    this.todoListItems = this.todoListItems.bind(this);
  }

  todoListItems(){
    return this.props.todos.map(todo => (
      <div key={todo.id}>
        <TodoListItem todo={todo} removeTodo={this.props.removeTodo} updateTodo={this.props.updateTodo}/>
      </div>
    ));
  }

  componentDidMount(){
    this.props.requestTodos();
  }

  render(){
    return (
      <div className="list">
        <ul className="todo-list">
          {this.todoListItems()}
        </ul>
        <TodoForm action={this.props.createTodo} />
      </div>
    );
  }
}



// const TodoList = ({todos, receiveTodo, removeTodo, updateTodo, fetchTodos}) => {
//   const todoListItems = todos.map(todo => (
//     <div key={todo.id}>
//         <TodoListItem todo={todo} removeTodo={removeTodo} updateTodo={updateTodo}/>
//     </div>
//   ));
//
//   componentDidMount(){
//     fetchTodos;
//   }
//
//   return (
//     <div className="list">
//       <ul className="todo-list">
//           {todoListItems}
//       </ul>
//       <TodoForm action={receiveTodo} />
//     </div>
//   );
// };


export default TodoList;
