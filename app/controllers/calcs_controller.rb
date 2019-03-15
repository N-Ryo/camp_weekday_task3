class CalcsController < ApplicationController
  # moduleで計算処理をまとめ、includeで呼び出す。
  include Common
  def show
    # http://localhost:3000/calcs/:num1/:calc/:num2
    # num1, num2が全角数字の場合、半角数字に矯正するためにtrメソッドを使用する。
    num1 = params[:num1].tr("０-９", "0-9")
    num2 = params[:num2].tr("０-９", "0-9")
    calc = params[:calc]
    # :calcのURL判定のための配列calcsを定義
    calcs = %w(addition subtraction multiplication division)
    # num1,num2が数値であることを判定
    # マイナスの値、小数点も計算可能
    @result = if num1 =~ /^(-[0-9]*)?([0-9]+.[0-9]*)?([0-9]+)$/ &&
                   num2 =~ /^(-[0-9]*)?([0-9]+.[0-9]*)?([0-9]+)$/
                # :calcの判定
                if calcs.include?(calc)
                  # calcモジュールの引数は3つ
                  calculation(num1.to_i, calc, num2.to_i)
                else
                  # joinメソッドで配列calcsを「, 」で区切ってString型に変更して出力
                  "calcエラーが発生しました。正しいURL [ #{calcs.join(", ")} ]"
                end
              else
                "numエラーが発生しました。数値を入力してください。"
              end
  end
end
