import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';

const configureStore = (preloadState = {}) => {
  const store = createStore(rootReducer, preloadState);
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

export default configureStore;
