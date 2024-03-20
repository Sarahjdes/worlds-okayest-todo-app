class TodosController < ApplicationController
  # Action for the index view
  def index
    # Selects all items
    @todos = Todo.all
  end

  def show
    # Selects an item depending on the :id param of the /todos/show/:id url
    @todo = Todo.find(params[:id])
  end

  def new
    # Instentiates a new entity
    @todo = Todo.new
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
      render :new, status: unprocessable_entity
    end
  end

  private
    def todo_params
      # params[:todo][:content]
      params.require(:todo).permit(:content)

      # Strong typing allows to pass an array or params in permit
      # params.require(:todo).permit(:content, :another_param)
    end
end
