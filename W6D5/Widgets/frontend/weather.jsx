import React from "react";

class Weather extends React.Component {
  constructor(props) {
    super(props);
    this.state = {city: "", weather: ""};
    this.requestCityAndTemp = this.requestCityAndTemp.bind(this);
  }

  componentDidMount() {
    navigator.geolocation.getCurrentPosition(this.requestCityAndTemp);
  }

  requestCityAndTemp(pos) {
    let lat = (pos.coords.latitude);
    let lon = (pos.coords.longitude);
    let url = `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&APPID=8be90699a5a337225c62343041bbcf4c`;
    let response = this.ajax(url);
  }

  ajax(url) {
    var request = new XMLHttpRequest();
    request.open('GET', url, true);
    let that = this;
    request.onload = function() {
      if (request.status >= 200 && request.status < 400) {
        // Success!
        var data = JSON.parse(request.responseText);
        let city = data['name'];
        let weather = data['main']['temp'];
        that.setState({ city, weather });
      }
    };
    request.send();
  }

  render () {
    return (
      <div>
        <p>
          { this.state.city }
        </p>
        <p>
          { this.state.weather }
        </p>
      </div>
    );
  }


}

export default Weather;
