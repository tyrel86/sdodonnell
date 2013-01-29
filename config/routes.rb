Sdodonnell::Application.routes.draw do

  resources :events

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
