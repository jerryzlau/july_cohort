const APIUtil = require('./api_util');
const FollowToggle = require('./follow_toggle');

class UsersSearch{
  constructor($nav){
    this.$nav = $nav;
    this.$input = $nav.find('input[name=username]');
    this.$ul = $nav.find('.users');
    this.$input.on('input', this.handleInput.bind(this));
  }

  handleInput(){
    APIUtil.searchUsers(this.$input.val())
           .then(users => this.renderResults(users));
  }

  renderResults(users){
    this.$ul.empty();
    users.forEach((user) => {
      let $a = $('<a>');
      let $li = $('<li>');
      $a.attr("href", `/users/${user.id}`);
      $a.html(`${user.username}`);
      $li.append($a);
      let button = this.createButton(user);
      $li.append(button);
      this.$ul.append($li);
    });
  }

  createButton(user){
    let button = $('<button></button>');
    let $followToggle = new FollowToggle(button, {
        userId: user.id,
        followState: user.followed ? "followed" : "unfollowed"
    });
    return button;
  }
}

module.exports = UsersSearch;
