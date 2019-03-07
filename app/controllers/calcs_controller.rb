class CalcsController < ApplicationController
  #moduleで計算処理をまとめ、includeで呼び出す。
  include Common
  def show
    #http://localhost:3000/calcs/:num1/:calc/num2
    #:calcのURL判定のための配列calcsを定義
    calcs = %w(addition subtraction multiplication division)
    #num1,num2が半角英数字の羅列であることを判定
    @result = if params[:num1] =~ /[^0-9]/ || params[:num2] =~ /[^0-9]/
                "numエラーが発生しました。半角英数字で入力してください。"
              else
                #:calcの判定
                if calcs.include?(params[:calc])
                  #calcモジュールの引数は3つ
                  calculation(params[:num1].to_i, params[:calc], params[:num2].to_i)
                else
                  #joinメソッドで配列calcsを「, 」で区切ってString型に変更して出力
                  "calcエラーが発生しました。正しいURL [ #{calcs.join(", ")} ]"
                end
              end
  end
end
