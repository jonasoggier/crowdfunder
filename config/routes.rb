Crowdfunder::Application.routes.draw do

	root :to => 'welcome#index'  
  
  resources :projects do
  	resources :pledges, :only => [:create]
  end

  resources :users, :except => [:index, :destroy]
	resource :session, :only => [:new, :create, :destroy]
  
	namespace :my do
		resources :projects
	end

 
end
