const APIUtil = require('./api_util');
const FollowToggle = require('./follow_toggle');

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
