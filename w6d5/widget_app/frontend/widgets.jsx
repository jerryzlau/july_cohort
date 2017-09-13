import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Weather from './weather';
import AutoComplete from './auto';
import Tabs from './tab';


class Root extends React.Component{

  render(){
    return(
      <div >
        <Clock />
        <div className="middle">
          <Weather />
            <AutoComplete name={['jerry',
                                'anastassia',
                                'adrienne',
                                'rebekah',
                                'david',
                                'tyler',
                                'tommy',
                                'priya',
                                'jimmy',
                                'brian',
                                'isak',
                                'katerina',
                                'allison']} />
          </div>
          <Tabs />
      </div>
    );
  }
}

document.addEventListener("DOMContentLoaded", () => {
	const root = document.getElementById("root");
	ReactDOM.render(<Root/>, root);
});
