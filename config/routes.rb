require 'sidekiq/web'

class AdminConstraint
  def matches?(request)
    admin_id = request.session[:admin_id]
  end
end

Rails.application.routes.draw do
  mount Sidekiq::Web => 'admin/sidekiq'
  root "pages#index"
  resources :rooms do
    resources :bookings
  end
  resources :reviews
  get '/bookings', to: 'bookings#choose_room'

  devise_for :admin, path: 'admin', controllers: {
            registrations: 'admin/registrations'
          }, :sign_out_via => [ :get ]
  namespace :admin do
    resources :reviews do
      member do
        get :toggle_status
      end
    end
    resources :bookings do
      member do
        get :toggle_status
      end
    end
    resources :rooms, :bookings, :reviews
    get '/admin/dashboard', as: :authenticated_root
    get 'dashboard', to: 'pages#dashboard'
    get 'statistic_csv(.:format)', to: 'files_for_bookings#download'
    get 'statistic_pdf(.:format)', to: 'pdf_for_bookings#download'

  end
  unauthenticated :admin do
    namespace :admin do
      root :to => 'session#new', as: :unauthenticated_root
    end
  end
end