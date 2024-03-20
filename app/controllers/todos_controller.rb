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

  def edit
    # Finds the current record to pre-fill the form field
    @todo = Todo.find(params[:id])
  end

  # Action on submit
  def update
    # Finds the current record
    @todo = Todo.find(params[:id])

    # Tries to update the current record with the params passed during form submission
    if @todo.update(todo_params)
      redirect_to @todo
    else
      render :edit, status: :unprocessable_entity
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
