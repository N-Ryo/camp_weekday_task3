class CalcsController < ApplicationController
  #moduleで計算処理をまとめ、includeで呼び出す。
  include Common
  def show
    #http://localhost:3000/calcs/:num1/:calc/num2
    #calcモジュールの引数は3つ
    calc(params[:num1].to_i, params[:calc], params[:num2].to_i)
  end
end







