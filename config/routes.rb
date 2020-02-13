Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/:id/notes" => "users#show"

  post "/" => "users#authenticate"
  post "/u" => "users#create"
end
