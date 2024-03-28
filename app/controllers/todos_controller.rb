# frozen_string_literal: true

class TodosController < ApplicationController
  # Action for the index view
  def index
    # Selects all items
    @todos = Todo.all
  end

  def show
    # Selects an item depending on the :id param of the /todos/show/:id url
    @todo = find_todo
  end

  def new
    # Instentiates a new entity
    @todo = Todo.new
  end

  def edit
    # Finds the current record to pre-fill the form field
    @todo = find_todo
  end

  # Action on submit
  def create
    # Instentiates a new entity with the params provided in the form
    @todo = Todo.new(todo_params)

    # Tries to save instance previously created
    if @todo.save
      # Redirects back to show page for that record
      # If redirect_to is passed a record, the url will be generated using a helper
      # redirect_to creates a new request, which we want to do after mutating the db or application state
      # so the request is not done twice if the page is refreshed by the user
      redirect_to @todo
    else
      # Will render new view with an unprocessable_entity status
      render :new, status: :unprocessable_entity
    end
  end

  # Action on submit
  def update
    # Finds the current record
    @todo = find_todo

    # Tries to update the current record with the params passed during form submission
    if @todo.update(todo_params)
      redirect_to @todo
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Action mapped to the DELETE /todos/:id request
  def destroy
    # Finds the todo corresponding to the /todos/show/id
    @todo = find_todo
    # Deletes that todo
    @todo.destroy

    # Redirects to the root_path (which we've configured to the list of todos, todos_path)
    redirect_to root_path, status: :see_other
  end

  private

  def find_todo
    # This would especially be useful if we wanted to set @todo
    # to something more complex than this
    Todo.find(params[:id])
  end

  def todo_params
    # Strong params allows to pass an array or params in permit
    params.require(:todo).permit(:title, :content)
  end
end
