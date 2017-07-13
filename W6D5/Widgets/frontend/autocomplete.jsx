import React from 'react';

class AutoComplete extends React.Component {
  constructor(props) {
    super(props);
    this.state = { inputVal: "" };
    this.setInput = this.setInput.bind(this);
    this.selectName = this.selectName.bind(this);
  }

  setInput(event) {
    let text = event.currentTarget.value;
    this.setState({ inputVal: text });
  }

  matchSearch() {
    if (!this.state.inputVal) { return this.props.names; }
    const matches = this.props.names.filter(name => {
      let input = this.state.inputVal.toLowerCase();
      let candidate = name.slice(0, input.length).toLowerCase();
      return input === candidate;
    });
    window.matches = matches;
    if (matches.length === 0) { return ['No matches.']; }
    return matches;
  }

  selectName(event) {
    let name = event.currentTarget.innerText;
    this.setState({ inputVal: name });
  }

  render() {
    const results = this.matchSearch().map((match, i) => (
      <li key={i} onClick={this.selectName}>{match}</li>
    ));
    return (
      <div>
        <h2>AutoComplete</h2>
        <div className="auto">
          <input onChange={this.setInput} value={this.state.inputVal} />
          <ul>
            {results}
          </ul>
        </div>
      </div>
    );
  }
}

export default AutoComplete;
