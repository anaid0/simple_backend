SimpleBackend::Application.routes.draw do

  get 'people/create_sample_data', :controller => 'people', :action => 'create_sample_data'
  resources :people, except: [:new, :edit]
  root 'people#index'
end
