import merge from 'lodash/merge';
import { RECEIVE_TODOS, RECEIVE_TODO } from '../actions/todo_actions';

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  let updatedState;
  switch(action.type) {
    case RECEIVE_TODOS:
      updatedState = {};
      action.todos.forEach(function(todo){ updatedState[todo.id] = todo; });
      return updatedState;
    case RECEIVE_TODO:
      const todo = { [action.todo.id]: action.todo };
      return merge({}, state, todo);
    default:
      return state;
  }
};

export default todosReducer;
