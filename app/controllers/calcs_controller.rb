class CalcsController < ApplicationController
  def show
    #http://localhost:3000/calcs/:num1/:calc/num2
    #showメソッド内でしか使わない変数はローカル変数で定義する。
    #num1,num2は計算処理で扱う、かつ、paramsで渡される型はStringなのでIntegerへ変換する。
    #Viewへ渡す変数はresultだけなので、resultのみインスタンス変数とする。
    num1 = params[:num1].to_i
    num2 = params[:num2].to_i
    calc = params[:calc]
    #:calcのURL判定のための配列calcsを定義
    calcs = %w(addition subtraction multiplication division)

    #num1,num2が半角英数字の羅列であることを判定
    @result = if params[:num1] =~ /[^0-9]/ || params[:num2] =~ /[^0-9]/
                "numエラーが発生しました。半角英数字で入力してください。"
              else
                #:calcの判定
                if calcs.include?(params[:calc])
                  case calc
                  when "addition"
                    num1 + num2
                  when "subtraction"
                    num1 - num2
                  when "multiplication"
                    num1 * num2
                  when "division"
                    #0で割る場合、エラーになるので、三項演算子でエラーメッセージも表示できるようにする。
                    num2 == 0 ? "0で割ることはできません" : num1 / num2
                  end
                else
                  #joinメソッドで配列calcsを「, 」で区切ってString型に変更して出力
                  "calcエラーが発生しました。正しいURL [ #{calcs.join(", ")} ]"
                end
              end
  end
end
