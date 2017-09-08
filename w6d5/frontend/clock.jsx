import React from 'react';

class Clock extends React.Component{
  constructor(){
    super();
    this.state = {time: new Date()};
    this.tick = this.tick.bind(this);
  }

  componentDidMount(){
    // this.intervalId = setInterval(this.tick(), 1000);
    this.intervalId = setInterval(this.tick, 1000);
  }

  componentWillUnmount(){
    clearInterval(this.intervalId);
  }

  tick(){
    // return () => this.setState({time: new Date()});
    this.setState({time: new Date()});
  }

  render(){
    let hours = this.state.time.getHours();
    let minutes = this.state.time.getMinutes();
    let seconds = this.state.time.getSeconds();
    let month = this.state.time.getMonth() + 1;
    let date = this.state.time.getDate();
    let year = this.state.time.getFullYear();
    let day = this.state.time.getDay();
    let timeZone = this.state.time.getTimezoneOffset();

    return (
      <div>
        <h1>Food Clock</h1>
        
        <div className="clock">
          <h4>Time: </h4>
          <h4> {hours} : {minutes} : {seconds} </h4>
        </div>

        <div className="date">
          <h4>Date: </h4>
          <h4> {day} {month}/{date}/{year} </h4>
        </div>

      </div>
    );
  }
}

export default Clock;
