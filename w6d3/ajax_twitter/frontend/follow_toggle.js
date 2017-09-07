const APIUtil = require('./api_util');

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
