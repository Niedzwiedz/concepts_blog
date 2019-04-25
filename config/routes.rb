Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index, :show, :create] do
        member do
          get :download
        end

        resources :comments, except: [:update, :destroy]
      end

      resources :comments, except: [:update, :destroy] do
        resources :comments, except: [:update, :destroy]
      end
    end
  end
end
