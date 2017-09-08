Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "group_events#index"
  resources :group_events

  namespace :api do
    namespace :v1 do
      resources :group_events
    end
  end

end
