require 'api_constraints'

GdgMuseumApi::Application.routes.draw do
  root "beacons#index"

  namespace :api, defaults: {format: "json"} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      resources :beacons
    end
  end

  resources :beacons

  end
