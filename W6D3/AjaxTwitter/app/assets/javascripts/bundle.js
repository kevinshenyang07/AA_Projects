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

const FollowToggle = __webpack_require__(1);
const UsersSearch = __webpack_require__(3);

$( ()=> {
  $("button.follow-toggle").each( (i, btn) => new FollowToggle(btn));
  $("nav.users-search").each( (i, nav) => new UsersSearch(nav));
});


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

class FollowToggle {
  constructor (el, options) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id") || options.userId;
    this.followState = this.$el.data("initial-follow-state") || options.followState;
    this.render();
    this.$el.on('click', this.handleClick.bind(this));
  }

  render() {

    switch (this.followState) {
      case "unfollowed":
        this.$el.html("Follow!");
        this.$el.removeAttr("disabled");
        break;
      case "following":
        this.$el.attr("disabled", "disabled");
        this.$el.html("following...");
        break;
      case "unfollowing":
        this.$el.attr("disabled", "disabled");
        this.$el.html("unfollowing...");
        break;
      case "followed":
        this.$el.html("Unfollow!");
        this.$el.removeAttr("disabled");
        break;
    }
  }

  handleClick(event) {
    const followToggle = this;
    event.preventDefault();

    if (this.followState === "unfollowed") {
      this.followState = "following";
      this.render();
      APIUtil.followUser(this.userId).then(() => {
        this.followState = "followed";
        this.render();
      });
    } else {
      this.followState = "unfollowing";
      this.render();
      APIUtil.unfollowUser(this.userId).then(() => {
        this.followState = "unfollowed";
        this.render();
      });
    }

  }
 }

module.exports = FollowToggle;


/***/ }),
/* 2 */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: id => APIUtil.changeFollowStatus(id, "POST"),
  unfollowUser: id => APIUtil.changeFollowStatus(id, "DELETE"),

  changeFollowStatus: (id, method) => (
    $.ajax({
      url: `/users/${id}/follow`,
      dataType: "json",
      method
    })
  ),

  searchUsers: (queryVal, success) => (
    $.ajax({
      url: "/users/search",
      method: "GET",
      dataType: "json",
      data: { query: queryVal },
      success
    })
  )

};

module.exports = APIUtil;


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);
const FollowToggle = __webpack_require__(1);

class UsersSearch {
  constructor (el) {
    const $nav = $(el);
    this.$input = $nav.find("input");
    this.$ul = $nav.find("ul.users");
    console.log(this.$input);
    console.log(this.$ul);
    this.$input.on('input', this.handleInput.bind(this));
  }

  handleInput(event) {
    event.preventDefault();
    const queryVal = this.$input.val();
    APIUtil.searchUsers(queryVal, this.onSuccess.bind(this));

  }

  onSuccess(users) {
    this.$ul.empty();
    users.forEach((user) => {

      let $li = $("<li></li>");
      let $a = $(`<a href=\"/users/${user.id}\">${user.username}</a>`);
      $li.append($a);
      let $btn = $("<button></button>");
      new FollowToggle ($btn, {userId: user.id, followState: user.followed ? "followed" : "unfollowed"});
      $li.append("<br>");
      $li.append($btn);
      this.$ul.append($li);

    });
  }
}

module.exports = UsersSearch;


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map