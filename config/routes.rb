Rails.application.routes.draw do
  root 'main#index'
  scope 'usuarios' do
    get '/' => 'users#index', as: 'user_index'
    get 'info/' => 'users#info', as: 'user_info'
    get 'new' => 'users#new', as: 'user_new'
    post 'create' => 'users#create', as: 'user_create'
    post ':id/update' => 'users#update', as: 'user_update'
  end

  scope 'personas' do
    get '/' => 'people#index', as: 'people_index'
    get 'info/' => 'people#info', as: 'people_info'
    get 'new' => 'people#new', as: 'people_new'
    get ':id/document' => 'people#generate', as: 'people_generate'
    post 'create' => 'people#create', as: 'people_create'
    post ':id/update' => 'people#update', as: 'people_update'
  end

  scope 'admin' do
    get 'config' => 'admin#config'
    post 'usuarios/id:/delete' => 'users#delete'
    post 'personas/id:/delete' => 'peple#delete'
  end
end
