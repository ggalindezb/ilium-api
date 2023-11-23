# frozen_string_literal: true

Rails.application.routes.draw do
  post :authentication, controller: :authentication

  get 'book/search'
  post 'book/reserve/:id', controller: :book, action: :reserve

  get 'reserve/:code', controller: :reserve, action: :show
  put 'reserve', controller: :reserve, action: :update

  get 'up' => 'rails/health#show', as: :rails_health_check
end
