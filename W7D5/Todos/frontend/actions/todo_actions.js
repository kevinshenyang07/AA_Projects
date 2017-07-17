export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";

// reset todos
export const receiveTodos = (todos) => ({
  type: RECEIVE_TODOS,
  todos
});

// add or update todo
export const receiveTodo = (todo) => ({
  type: RECEIVE_TODO,
  todo
});
