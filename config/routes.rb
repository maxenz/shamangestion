Shamangestion::Application.routes.draw do

  resources :clientes_licencias_productos_productos_modulos


  resources :clientes_licencias_productos


  resources :usuarios_clientes 

  resources :usuarios

  get "clientes_gestiones/new"

  get "clientes_gestiones/destroy"

  get "clientes_gestiones/index"

  get "clientes_gestiones/update"

  get "clientes_gestiones/edit"

  get "clientes_gestiones/create"

  resources :tipo_terminales

  resources :estados

  devise_for :users

  resources :licencias

  resources :productos do
    resources :productos_modulos
  end

  resources :clientes do
    resources :clientes_contactos
    resources :clientes_licencias do
      get 'set_modulos'
      post 'guardar_borrar_modulos'
    end
    resources :clientes_gestiones
    resources :clientes_terminales
  end

  resources :clientes_contactos

  resources :paises do
    resources :provincias do
      resources :localidades
    end
  end

  authenticated :user do
    root :to => "home#index"
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  match 'log' => 'licencias_logs#index'

  match 'update_clientes' => 'clientes#update_clientes'

  match 'update_clientes2' => 'clientes#update_clientes2'

  match 'contactos' => 'clientes_contactos#index'

end
