# frozen_string_literal: true

Rails.application.routes.draw do
  get 'book/search'
  post 'book/reserve/:id', controller: :book, action: :reserve

  get 'up' => 'rails/health#show', as: :rails_health_check
end
