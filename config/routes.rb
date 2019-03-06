Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'calcs/:num1/:calc/:num2', to: 'calcs#show'
end
