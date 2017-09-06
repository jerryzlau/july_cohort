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
    }else{
      this.$el.html("Unfollow!");
    }
  }

  handleClick(){
    this.$el.on("click", event => {
      event.preventDefault();
      let follow = '';

      if (this.followState === "unfollowed"){
        follow = 'POST';
      }else{
        follow = 'DELETE';
      }

      $.ajax({
        url: `/users/${this.userId}/follow`,
        type: follow,
        dataType: 'JSON',
        success: this.successCall(follow),
        error: function(errMsg) {
          console.log(errMsg);
        }
      });


    });
  }

  successCall(follow){
    if (follow === 'POST'){
      this.followState = 'followed';
      console.log('You have followed this person!');
    }else{
      this.followState = 'unfollowed';
      console.log('You have unfollowed this person!');
    }
    this.render();
  }
}



module.exports = FollowToggle;
