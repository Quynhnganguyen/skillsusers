Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :skills, only: [:create_all] do 
  	collection do
  		post :create_all
  		get :report_by_sql
  		get :report_without_sql
  	end
  end

  resources :users, only: [:create_all] do 
  	collection do
  		post :create_all
  		post :add_skills_to_various
  	end
  end
end
