import React from 'react';

class Headers extends React.Component {
  render() {
    let selected = this.props.selectedPane;

    let headers = this.props.panes.map((pane, idx) => {
      let title = pane.title;
      let className = (idx === selected) ? 'active' : '';
      return (
        <li key={idx} className={className}
          onClick={this.props.onTabChosen.bind(null, idx)}>
          {title + ' '}
        </li>
      );
    });

    return (
      <ul className='tab-header'>
        {headers}
      </ul>
    );
  }
}

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = { selectedPane: 0 };
    this.selectTab = this.selectTab.bind(this);
  }

  selectTab(num) {
    this.setState({selectedPane: num});
  }

  render() {
    let pane = this.props.panes[this.state.selectedPane];
    return (
      <div>
        <h1>Tabs</h1>
        <div className='tabs'>
          <Headers
            selectedPane={this.state.selectedPane}
            onTabChosen={this.selectTab}
            panes={this.props.panes}>
          </Headers>
          <div className='tab-content'>
            <article>
              {pane.content}
            </article>
          </div>
        </div>
      </div>
    );
  }
}

export default Tabs;
