import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { title: null, body: null, done: false};
    this.linkState = this.linkState.bind(this);
  }

  linkState(key) {
    return (event => this.setState({ [key]: event.currentTarget.value}));
  }

  

  render() {
    return (
      <div>
        <input onChange={this.linkState('title')} placeholder="title" />
        <textarea onChange={this.linkState('body')} placeholder="body" />
        <submit></submit>
      </div>
    );
  }

}

export default TodoForm;
