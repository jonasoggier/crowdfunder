Crowdfunder::Application.routes.draw do

	root :to => 'welcome#index'  
  
  resources :projects

  


 
end
