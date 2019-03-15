Rails.application.routes.draw do
  # 支持通り、演算子を挟む形でリクエストURLを宣言する。
  # num1, num2に関して、小数点を含むパラメタを拡張子と判定させないためにconstraintsオプションを追加
  get 'calcs/:num1/:calc/:num2', to: 'calcs#show', constraints: { num1: /[^\/]+/, num2: /[^\/]+/ }
end
