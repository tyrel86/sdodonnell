Sdodonnell::Application.routes.draw do
  # Authentication
  resources :admins
  get "/admin_login" => "admin_sessions#new", as: :admin_login
  get "/admin_logout" => "admin_sessions#destroy"
	resources :admin_sessions

  resources :events
  resources :blogs
	match '/feed' => 'blogs#feed',
      :as => :feed,
      :defaults => { :format => 'atom' }

  get "feeds/index"
	

	root to: "pages#home"
	match "/home" => "pages#home"
	match "/biography" => "pages#biography"
	match "/press-kit" => "pages#press_kit"
	match "/deadly-memories" => "pages#deadly_memories"
	match "/deadly-bayou" => "pages#deadly_bayou"
	match "/news-events" => "pages#news_events"
	match "/resources" => "pages#resources"
	match "/contact" => "pages#contact"
	get "/subscribers/confirm/:key" => "subscribers#confirm", as: :confirm_subscriber
	get "/subscribers/unsubscribe/:key" => "subscribers#confirm", as: :unsubscribe_subscriber
	resource :subscribers
	resource :contacts
	devise_for :users
end
