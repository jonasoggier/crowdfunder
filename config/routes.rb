Crowdfunder::Application.routes.draw do

	root :to => 'welcome#index'  
  
  resources :projects do
  	resources :pledges, :only => [:create]
  end

  resources :users, :except => [:index, :destroy]
	resource :session, :only => [:new, :create, :destroy]
  
	namespace :my do            # namespace
		resources :projects do    # nested resources
			 	resources :images
		end
	end
 
end
