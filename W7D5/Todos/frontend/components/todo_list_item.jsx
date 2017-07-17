import React from 'react';
import merge from 'lodash/merge';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = { detail: false };
    this.toggleTodo = this.toggleTodo.bind(this);
  }

  toggleTodo(event) {
    event.preventDefault();
    const toggledTodo = merge(
      {}, this.props.todo, { done: !this.props.todo.done }
    );
    this.props.receiveTodo(toggledTodo);
  }

  render() {
    const { todo } = this.props;
    const { title, done } = todo;

    return (
      <li className="todo-list-item">
        <div className="todo-header">
          <h3><a>{ title }</a></h3>
          <button
            className={ done ? "done" : "undone" }
            onClick={this.toggleTodo}>
            { done ? "Undo" : "Done" }
          </button>
        </div>
      </li>
    );
  }
}

export default TodoListItem;
