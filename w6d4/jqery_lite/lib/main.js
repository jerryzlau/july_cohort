const DOMNodeCollection = require('./dom_node_collection');

$( () => {
  window.$l = (selector) => {
    if (typeof selector === 'string'){
      let elementList = Array.from(document.querySelectorAll(selector));
      return new DOMNodeCollection(elementList);
    }else if(selector instanceof HTMLElement){
      return new DOMNodeCollection([selector]);
    }
  };

});
