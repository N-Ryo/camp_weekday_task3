class CalcsController < ApplicationController
  def show
    #http://localhost:3000/calcs/:num1/:calc/num2
    #showメソッド内でしか使わない変数はローカル変数で定義する。
    #num1,num2は計算処理で扱う、かつ、paramsで渡される型はStringなのでIntegerへ変換する。
    #Viewへ渡す変数はresultsだけなので、resultsのみインスタンス変数とする。
    num1 = params[:num1].to_i
    num2 = params[:num2].to_i
    calc = params[:calc]
    #空の配列@resultsを定義
    @results = []
    #:calcで計算処理を分岐させる。
    @results << case calc
                when "addition"
                  num1 + num2
                when "subtraction"
                  num1 - num2
                when "multiplication"
                  num1 * num2
                when "division"
                  begin
                    [num1 / num2 , num1 % num2]
                  rescue
                    "divided by #{num2}"
                  end
                end
    #divisionで商と余りの配列が入れ子になっているので、flatten!メソッドで均す。
    @results.flatten!
  end
end







