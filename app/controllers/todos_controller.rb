class TodosController < ApplicationController
  # Action for the index view
  def index
    @todos = Todo.all
  end
end
