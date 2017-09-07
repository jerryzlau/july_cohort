const followToggle = require('./follow_toggle');
const usersSearch = require('./users_search');

$( () => {
  // Your code here
  $('button.follow-toggle').each((index, button) => {
    const followTog = new followToggle($(button));
  });

  $('nav.users-search').each((index, nav) => {
    const userSearch = new usersSearch($(nav));
  });
});
