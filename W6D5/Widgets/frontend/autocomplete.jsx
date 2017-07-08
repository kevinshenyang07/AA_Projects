import React from 'react';

class AutoComplete extends React.Component {
  constructor(props) {
    super(props);
    this.createResults = this.createResults.bind(this);
    let results = this.createResults();
    this.state = { inputVal: "", results };
    this.setInput = this.setInput.bind(this);
    this.searchResults = this.searchResults.bind(this);
  }

  createResults() {
    let words = ['ada', 'c++', 'python', 'scala'];
    return words.map((word, i) => (
      <li key={i} onClick={this.setInput}>{word}</li>
    ));
  }

  setInput(event) {
    let text = event.target.value;
    this.setState({ inputVal: text });
  }

  searchResults(event) {
    let text = event.target.value;
    let filtered = this.state.results.filter(li => {
      return text === li.props.children.slice(0, text.length);
    });
    this.setState({ inputVal: text, results: filtered});
  }

  render() {
    return (
      <div>
        <h2>AutoComplete</h2>
        <div className="auto">
          <input onChange={this.searchResults} value={this.state.inputVal} />
          <ul>
            {this.state.results}
          </ul>
        </div>
      </div>
    );
  }
}

export default AutoComplete;
