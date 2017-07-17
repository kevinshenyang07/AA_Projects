import React from 'react';
import ReactDOM from 'react-dom';

import configureStore from './store/store';
import Root from './components/root';

document.addEventListener("DOMContentLoaded", () => {
  const preloadState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadState);
  window.store = store;
  ReactDOM.render(<Root store={store} />, document.getElementById('content'));
});
