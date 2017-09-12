import React from 'react';

class TodoDetailView extends React.Component {

  constructor(props){
    super(props);

    

  }

  render() {
    return(
      <div className="todo-item">


        <span>
          {this.props.todo.body}
        </span>

        <button onClick={this.handleRemove}>
          Delete Todo
        </button>
      </div>
    );
  }


}

export default TodoDetailView;
