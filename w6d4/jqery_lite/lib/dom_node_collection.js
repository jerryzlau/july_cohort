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
}


module.exports = DOMNodeCollection;
