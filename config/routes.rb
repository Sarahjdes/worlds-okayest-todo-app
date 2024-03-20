Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "todos#index"

  # Creates routes for the standard CRUD actions as well as _path and _url helpers
  resources :todos
    # index     todos       /todos
    # show      todo        /todos/:id
    # new       new_todo    /todos/
    # edit      edit_todo   /todos/:id/edit
    # create    on submit
    # update    on submit
    # destroy

    # helpers
      # - todos_path    used to generate path in the application (in views)
      # - todos_url     used to generate urls like for redirects or external links (in controller)
end
