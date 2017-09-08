class DOMNodeCollection {
  constructor($el){
    this.$el = $el;
  }

  html(string = undefined){
    if (typeof string === 'undefined'){
      return this.$el[0].innerHTML;
    }else{
      this.$el.forEach(el => {
        el.innerHTML = string;
      });
    }
  }

  empty(){
    this.$el.forEach(el => {
      el.innerHTML = "";
    });
  }

  append(string){
    this.$el.forEach(el => {
      el.innerHTML += string;
    });
  }

  attr(tag, data){
    this.$el.forEach(el => {
      el.attributes[tag] = data;
    });
  }

  addClass(c){
    this.$el.forEach(el => {
      el.className += ", " + c;
    });
  }

  removeClass(c){
    this.$el.forEach(el => {
      let classes = el.className.split(",");
      let wanted = [];
      classes.forEach(cl => {
        if(c !== cl) wanted.push(cl);
      });
      el.className = wanted.join(", ");
    });
  }

  //traversal
  children(){
    let kids = [];
    this.$el.forEach(el => {
      Array.from(el.children).forEach(cl => {
        kids.push(cl);
      });
    });
    return new DOMNodeCollection(kids);
  }

  parent(){
    let parents = [];
    this.$el.forEach(el => {
      parents.push(el.parentNode);
    });

    return new DOMNodeCollection(parents);
  }

  find(selector){
    let result = [];
    this.$el.forEach(el => {
      result.push(el.querySelectorAll(selector));
    });
    return new DOMNodeCollection(result);
  }

  remove(){
    this.$el.forEach(el => {
      el.remove();
    });

    this.$el = [];
  }

}


module.exports = DOMNodeCollection;
