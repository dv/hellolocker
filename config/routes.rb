Rails.application.routes.draw do

  if SingleUserMode.enabled?
    devise_for :users, skip: :registrations
  else
    devise_for :users
  end

  resource :dashboard, controller: "dashboard"
  resources :items

  root to: redirect('/dashboard')

  get "/:label" => "labels#show", as: "label"

end
