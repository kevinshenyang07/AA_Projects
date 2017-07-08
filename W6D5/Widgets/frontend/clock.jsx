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
    return (
      <div>
        <h2>Clock</h2>
        <div className="clock">
          <p>
            <span>Time:</span>
            <span>{hours}:{minutes}:{seconds}</span>
          </p>
          <p>
            {this.state.datetime.toDateString()}
          </p>
        </div>
      </div>);
  }

}

export default Clock;
