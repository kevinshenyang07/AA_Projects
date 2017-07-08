import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Weather from './weather';
import AutoComplete from './autocomplete';
// import Tabs from './tabs';

const Panes = [
  {title: 'one', content: 'I am the first'},
  {title: 'two', content: 'Second pane here'},
  {title: 'three', content: 'Third pane here'}
];

class Root extends React.Component {
  render() {
    return (
      <div>
        <Clock />
        <Weather />
        <div className="interactive">
          <AutoComplete />
        </div>
      </div>
    );
  }
}

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<Root />, document.getElementById("root"));
});
