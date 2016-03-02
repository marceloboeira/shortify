Rails.application.routes.draw do
  root to: "application#index"

  mount API => "/"

  get "/:slug", to: "gateway#redirect"
end
