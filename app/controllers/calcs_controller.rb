class CalcsController < ApplicationController
  def show
    #http://localhost:3000/calcs/:num1/:calc/num2
    #showメソッド内でしか使わない変数はローカル変数で定義する。
    #num1,num2は計算処理で扱う、かつ、paramsで渡される型はStringなのでIntegerへ変換する。
    #Viewへ渡す変数はresultだけなので、resultのみインスタンス変数とする。
    num1 = params[:num1].to_i
    num2 = params[:num2].to_i
    calc = params[:calc]
    #:calcで計算処理を分岐させる
    @result = case calc
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
  end
end
