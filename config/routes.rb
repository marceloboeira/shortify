Rails.application.routes.draw do
  get "/:slug", to: "gateway#redirect"
end
