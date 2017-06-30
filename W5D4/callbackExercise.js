class Clock {
  constructor() {
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    const date = new Date();
    this.seconds = date.getSeconds();
    this.minutes = date.getMinutes();
    this.hours = date.getHours();
    setInterval(this._tick.bind(this), 1000);

  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    let hours = this.hours;
    let minutes = this.minutes;
    let seconds = this.seconds;

    if (hours < 10) {
      hours = "0" + hours;
    }
    if (minutes < 10) {
      minutes = "0" + minutes;
    }
    if (seconds < 10) {
      seconds = "0" + seconds;
    }
    console.log(`${hours}:${minutes}:${seconds}`);
  }

  _tick() {
    // debugger;
    // 1. Increment the time by one second.
    // 2. Call printTime.
    // this.date.setSeconds(this.date.getSeconds + 1);
    this.seconds += 1;
    this.printTime();
  }

}

const clock = new Clock();
