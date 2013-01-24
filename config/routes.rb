Sdodonnell::Application.routes.draw do
  resources :events


  get "feeds/index"

	root to: "pages#home"
	match "/home" => "pages#home"
	match "/biography" => "pages#biography"
	match "/press-kit" => "pages#press-kit"
	match "/deadly-memories" => "pages#deadly-memories"
	match "/deadly-bayou" => "pages#deadly-bayou"
	match "/news-events" => "pages#news_events"
	match "/resources" => "pages#resources"
	match "/contact" => "pages#contact"
	resource :subscribers
	devise_for :users
end
