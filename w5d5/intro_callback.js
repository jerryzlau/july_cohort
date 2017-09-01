class Clock {
  constructor() {
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    this.date = new Date();
    this.hour = this.date.getHours();
    this.min = this.date.getMinutes();
    this.sec = this.date.getSeconds();
    setInterval(() => {
      this.printTime();
      this._tick();
    },1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    console.log(`${this.hour}:${this.min}:${this.sec}`);
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    this.sec++;
    if (this.sec === 60){
      this.sec = 0;
      this.min++;
    }

    if (this.min === 60){
      this.min = 0;
      this.hour++;
    }

    if (this.hour === 24){
      this.hour = 0;
    }

  }
}

// const clock = new Clock();

// addNumbers
const readline = require('readline');

/* globals reader */
reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback){
  if (numsLeft > 0){
    reader.question("Give me a number:", function(answer){
      sum += parseInt(answer);
      console.log(sum);
      addNumbers(sum, numsLeft-1, completionCallback);
    });
  }

  if (numsLeft === 0){
    completionCallback(sum);
    reader.close();
  }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
