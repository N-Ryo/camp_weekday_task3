Rails.application.routes.draw do
  # 支持通り、演算子を挟む形でリクエストURLを宣言する。
  get 'calcs/:num1/:calc/:num2', to: 'calcs#show', constraints: { num1: /[^\/]+/, num2: /[^\/]+/ }
end
