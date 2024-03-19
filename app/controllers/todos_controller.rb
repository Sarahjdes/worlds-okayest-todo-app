class TodosController < ApplicationController
  # Action for the index view
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end
end
