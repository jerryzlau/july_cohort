import React from 'react';
// import uniqueId from '../../util';

class TodoForm extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      done: false
    };
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

  submit(e){
    e.preventDefault();
    this.props.action(this.state);
    // const newState = {id: uniqueId()};
    // Object.assign(this.state, newState);
    // this.props.action(this.state);
    this.setState({title: "",
                   body: "",
                   done: false});
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
