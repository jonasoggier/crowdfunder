Crowdfunder::Application.routes.draw do

	root :to => 'welcome#index'  
  
  resources :projects do
  	resources :pledges, :only => [:index, :create]
  end

  resources :users, :except => [:index, :destroy]
	resource :session, :only => [:new, :create, :destroy]
  


 
end
