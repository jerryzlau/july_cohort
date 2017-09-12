import React from 'react';
import uniqueId from '../../util';

class TodoForm extends React.Component {

  constructor(action) {
    super();
    this.state = {
      title: "",
      body: "",
      id: "",
      done: false
    };
    this.action = action;
    this.submit = this.submit.bind(this);
    this.setTitle = this.setTitle.bind(this);
    this.setBody = this.setBody.bind(this);
  }

  setTitle(e){
    e.preventDefault();
    const title = e.target.value;
    this.setState({title});
  }

  setBody(e){
    e.preventDefault();
    const body = e.target.value;
    this.setState({body});
  }

  submit(){
    const id = uniqueId();
    this.setState({id});
    debugger
    this.action(this.state);
  }

  render() {
    let {title, body} = this.state;
    return (
      <div>
        <form>
          <label>
            title:
            <input onChange={this.setTitle} value={title}></input>
          </label>
          <label>
            body:
            <input onChange={this.setBody} value={body}></input>
          </label>

          <button onClick={this.submit}>submit</button>
        </form>
      </div>
    );
  }
}

export default TodoForm;
