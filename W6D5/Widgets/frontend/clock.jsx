import React from "react";


class Clock extends React.Component {

  constructor(props) {
    super(props);
    this.state = {datetime: new Date()};
    this.tick = this.tick.bind(this);
  }

  tick() {
    this.setState({datetime: new Date()});
  }

  componentDidMount() {
    this.intervalId = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    this.intervalId.clearInterval();
  }

  render() {
    let hours = this.state.datetime.getHours();
    let minutes = this.state.datetime.getMinutes();
    let seconds = this.state.datetime.getSeconds();
    // return `${hours}:${minutes}:${seconds}`;
    return (
      <div className="datetime">
        <p>
          <span>Time:</span>
          <span>{hours}:{minutes}:{seconds}</span>
        </p>
        <p>
          <span>Date:</span>
          <span>{this.state.datetime.toDateString()}</span>
        </p>
      </div>);
  }

}

export default Clock;
