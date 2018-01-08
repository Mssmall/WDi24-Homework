class TestingController < ApplicationController

  def testing
  end

  def calculator


    @num1a = "0"
    @num2a = "0"
    @opertora = "+"

    @num1a = params[:num1a]
    @num2a = params[:num2a]
    @operatora = params[:operatora]

    @num1a = @num1a.to_f
    @num2a = @num2a.to_f

    @resulta = "Sorry, can't compute............"
    case @operatora
    when "+"
      @resulta = @num1a + @num2a
    when "-"
      @resulta = @num1a - @num2a
    when "*"
      @resulta = @num1a * @num2a
    end
    # is there a case else? What is it??




    @num1 = params[:num1]
    @num2 = params[:num2]
    @operator = params[:operator]

    @num1 = @num1.to_f
    @num2 = @num2.to_f

    @result = "Sorry, can't compute"
    case @operator
    when "+"
      @result = @num1 + @num2
    when "-"
      @result = @num1 - @num2
    when "*"
      @result = @num1 * @num2
    end
    # is there a case else? What is it??

  end

end
