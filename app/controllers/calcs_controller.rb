class CalcsController < ApplicationController
  def show
    num1 = params[:num1].to_i
    num2 = params[:num2].to_i
    calc = params[:calc]
    @result = if calc == "addition"
                num1 + num2
              elsif calc == "subtraction"
                num1 - num2
              elsif @calc == "multiplication"
                num1 * num2
              elsif calc == "division"
                num2 == 0 ? "0で割ることはできません" : num1 / num2
              end
  end
end
