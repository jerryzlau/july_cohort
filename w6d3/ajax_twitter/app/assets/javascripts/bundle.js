/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const followToggle = __webpack_require__(1);
const usersSearch = __webpack_require__(3);

$( () => {
  // Your code here
  $('button.follow-toggle').each((index, button) => {
    const followTog = new followToggle($(button));
  });

  $('nav.users-search').each((index, nav) => {
    const userSearch = new usersSearch($(nav));
  });
});


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

class FollowToggle {
  constructor($el){
    this.userId = $el.data("user-id");
    this.followState = $el.data("initial-follow-state");
    this.$el = $el;
    this.render();
    this.handleClick();
  }

  render(){
    if(this.followState === "unfollowed"){
      this.$el.html("Follow!");
      this.$el.prop("disabled", false);
    }else if(this.followState === "followed"){
      this.$el.html("Unfollow!");
      this.$el.prop("disabled", false);
    }else if (this.followState === "following"){
      this.$el.html("following");
      this.$el.prop("disabled", true);
    }else if (this.followState === "unfollowing"){
      this.$el.html("unfollowing");
      this.$el.prop('disabled', true);
    }
  }

  handleClick(){
    this.$el.on("click", event => {
      event.preventDefault();
      if (this.followState === "unfollowed"){
        this.followState = "following";
        this.render();
        APIUtil.followUser(this.userId).then(() => {
          this.followState = "followed";
          this.render();
        });
      }else if(this.followState === "followed"){
        this.followState = 'unfollowing';
        this.render();
        APIUtil.unfollowUser(this.userId).then(() => {
          this.followState = "unfollowed";
          this.render();
        });
      }
    });
  }

}



module.exports = FollowToggle;


/***/ }),
/* 2 */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: id => {
    // ...
    return $.ajax({
      url: `/users/${id}/follow`,
      type: 'POST',
      dataType: 'JSON'
    });
  },

  unfollowUser: id => {
    // ...
    return $.ajax({
      url: `/users/${id}/follow`,
      type: 'DELETE',
      dataType: 'JSON'
    });
  },

  searchUsers: query => {
    return $.ajax({
      url: `/users/search`,
      type: 'GET',
      dataType: 'JSON',
      data: {query}
    });
  }
};

module.exports = APIUtil;


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);
const FollowToggle = __webpack_require__(1);

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


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map