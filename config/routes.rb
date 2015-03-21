Stageorders::Application.routes.draw do
  devise_for :users

  resources :users

  resources :blogs

  get "status/index"

  get "status/refresh"

  resources :status

  get "stage_statuses/index"

  get "stage_statuses/refresh"

  resources :stage_statuses

  resources :stage_status_codes

  resources :support_units

  resources :support_status_codes

  resources :support_types

  get "results/index"

  get "results/refresh"

  resources :results

  resources :runners

  resources :runner_status_codes

  resources :teams

  resources :stages

  get '/results/change_team' => 'results#change_team'
  get '/results/refresh' => 'results#refresh'
  get '/status/change_team' => 'status#change_team'
  get '/status/refresh' => 'status#refresh'
  get '/stage_statuses/change_team' => 'stage_statuses#change_team'
  get '/stage_statuses/refresh' => 'stage_statuses#refresh'
  get '/stage_statuses/update_results' => 'stage_statuses#update_results'
  get '/stage_statuses/update_blog' => 'stage_statuses#update_blog'

  root :to => "home#index"

end
