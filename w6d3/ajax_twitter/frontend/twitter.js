const followToggle = require('./follow_toggle');

$( () => {
  // Your code here
  $('button.follow-toggle').each((index, button) => {
    const followTog = new followToggle($(button));
  });
});
