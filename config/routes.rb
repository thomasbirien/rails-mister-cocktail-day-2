Rails.application.routes.draw do
  # root => racine de l'app
  # GET /cocktails => index
  # GET /cocktails/:id => show
  # GET /cocktails/new => new
  # POST /cocktails => create
  root 'cocktails#index'
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
  # GET /cocktails/:cocktail_id/doses/new
  # POST /cocktails/:cocktail_id/doses
  # DELETE /doses/:id
end
