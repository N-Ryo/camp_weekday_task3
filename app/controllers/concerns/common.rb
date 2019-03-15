module Common
  extend ActiveSupport::Concern
  #CalcControllerで使用する計算処理をmoduleで管理する。
  #paramsの値は引数として渡す。
  def calculation(num1, calc, num2)
    #:calcで計算処理を分岐させる。
    #caseの返り値を@resultに格納する。
    case calc
              when "addition"
                num1 + num2
              when "subtraction"
                num1 - num2
              when "multiplication"
                num1 * num2
              when "division"
                #ZeroDivisionErrorを検出する
                begin
                  "#{num1 / num2}..#{num1 % num2}"
                #「rescue => e」でエラーコードを変数eに格納する
                rescue => e
                  e
                end
              end
  end
end