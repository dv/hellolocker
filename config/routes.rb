Rails.application.routes.draw do

  if SingleUserMode.enabled?
    devise_for :users, skip: :registrations
  else
    devise_for :users
  end

  resource :dashboard, controller: "dashboard"
  resources :items do
    resources :links
  end

  root to: redirect('/dashboard')

  get "/:label" => "labels#show", as: "label_link"

end
