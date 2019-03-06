module Common
  extend ActiveSupport::Concern
  #CalcControllerで使用する計算処理をmoduleで管理する。
  #paramsの値は引数として渡す。
  def calc(num1, calc, num2)
    #:calcで計算処理を分岐させる。
    #caseの返り値を@resultに格納する。
    @result = case calc
              when "addition"
                num1 + num2
              when "subtraction"
                num1 - num2
              when "multiplication"
                num1 * num2
              when "division"
                #ZeroDivisionErrorを検出する
                begin
                  if num1 % num2 == 0
                    num1 / num2
                  else
                    "#{num1 / num2}..#{num1 % num2}"
                  end
                #「rescue => e」でエラーコードを変数eに格納する
                rescue => e
                  e
                end
              end
  end
end