Rails.application.routes.draw do
  root 'sites#new'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'sites/new'
  get '/:short_url', to: "sites#show"

  resources :sites
end
