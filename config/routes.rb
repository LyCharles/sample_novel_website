Rails.application.routes.draw do
  # 添加语言切换路由
  get '/switch_locale/:locale', to: 'locales#switch', as: :switch_locale
  
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'novels#index'
    
    resources :novels do
      get 'rankings', on: :collection
      resources :chapters, only: [:show]
    end
    
    resources :categories, only: [:index, :show]
    resources :users, only: [:new, :create]
    
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end
end
