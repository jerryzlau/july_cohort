import React from 'react';

class AutoComplete extends React.Component{
  constructor(props){
    super(props);
    this.state = {inputVal: "", names: []};
    this.handleSearch = this.handleSearch.bind(this);
  }

  cap(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
  }

  handleSearch(e){
    let inputVal = e.target.value;
    let names; 

    if (inputVal === "") {
      names = [];
    }else{
      names = this.props.name.filter(function(n){
        return n.substring(0,inputVal.length) === inputVal;
      });
      console.log(names);
    }

    this.setState({inputVal, names});
  }

  render(){
    let {inputVal, names} = this.state;
    return (
      <div>
        <br/>
        <h1>Search Bar</h1>
        <div className="name-search">
          <br/>
          <label>
            Search Names: <input type="text" onChange={this.handleSearch} value={inputVal}></input>
          </label>

          <ul>
            {
              names.map(el => (
                <li key={el}>{this.cap(el)}</li>
              ))
            }
          </ul>
        </div>
      </div>
    );
  }
}

export default AutoComplete;
