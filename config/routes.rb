Rails.application.routes.draw do
  # Rutas para Devise (Candidatos)
  devise_for :candidates

  # Rutas para el modelo Candidate (excepto las rutas de Devise)
  resources :candidates

  resources :account_creation_requests do
    get 'pending_requests', on: :collection
  end
  # Rutas para las aplicaciones del candidato
  resources :applications

  # Rutas para el modelo JobOffer
  resources :job_offers

  # Rutas para el modelo Recruiter
  resources :recruiters
  put 'account_creation_requests/approved/:token', to: 'account_creation_requests#approved', as: :approved_account_creation_request

  # Ruta para crear una solicitud de registro
  post 'create_account_creation_request', to: 'account_creation_requests#create', as: :create_account_creation_request

  # Ruta para el listado de solicitudes pendientes de aprobación
  get 'account_creation_requests/pending_requests', to: 'account_creation_requests#pending_requests', as: :pending_account_creation_requests

  # Ruta de inicio
  root 'home#index'
end
