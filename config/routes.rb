Rails.application.routes.draw do
  root 'links#index'
  get '/:slug', to: 'links#redirect_slug'
  post '/', to: 'links#create'
end
