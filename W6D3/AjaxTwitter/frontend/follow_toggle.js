const APIUtil = require("./api_util.js");

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
