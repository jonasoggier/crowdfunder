Crowdfunder::Application.routes.draw do

	root :to => 'welcome#index'  
  
  resources :projects
  resources :users, :except => [:index, :destroy]

  


 
end
