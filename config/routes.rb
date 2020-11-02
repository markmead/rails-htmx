Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts do
    collection do
      put :live
      put :draft
    end
  end
end
