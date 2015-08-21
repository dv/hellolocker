Rails.application.routes.draw do

  if SingleUserMode.enabled?
    devise_for :users, skip: :registrations
  else
    devise_for :users
  end

  resource :dashboard, controller: "dashboard"

  root to: redirect('/dashboard')

  get "/:id" => "items#show", as: "item"

end
