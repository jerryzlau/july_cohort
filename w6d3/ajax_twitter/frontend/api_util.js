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
