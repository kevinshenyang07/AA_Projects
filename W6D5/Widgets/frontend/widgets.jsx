import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock.jsx';
import Weather from './weather.jsx';


document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(
      <div>
        <h1>Clock</h1>
        <Clock/>
        <h1>Weather</h1>
        <Weather/>
      </div>, root);

});
