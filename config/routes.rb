Rails.application.routes.draw do
  root to: "application#index"

  get "/:slug", to: "gateway#redirect"
end
