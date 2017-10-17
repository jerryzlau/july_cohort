import React from 'react';
import {Link} from 'react-router-dom';

class Greeting extends React.Component {
  constructor(props){
    super(props);
  }

  render(){
    const {currentUser, logout} = this.props;
    return (
      (currentUser) ?
        (
          <div>
            <h1>Welcome back {currentUser.username}!</h1>
            <button onClick={logout}>Log Out</button>
          </div>
        ) : (
          <nav>
            <Link to='/signup'>Sign Up</Link>
            <br/>
            <Link to='/login'>Log In</Link>
          </nav>
        )
    );
  }
}

export default Greeting;
