Rails.application.routes.draw do
  devise_for :users, path: 'api/auth', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
   root "homes#index"
end
