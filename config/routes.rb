Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "tasks", to: "tasks#index", as: :index

  get "tasks/new", to: "tasks#new", as: :new
  post "tasks", to: "tasks#create", as: :tasks

  get "tasks/:id/edit", to: "tasks#edit", as: :edit
  patch "tasks/:id", to: "tasks#update", as: :update

  get "tasks/:id", to: "tasks#show", as: :show

  delete "tasks/:id", to: "tasks#destroy", as: :destroy

end
