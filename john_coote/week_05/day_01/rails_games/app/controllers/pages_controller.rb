class PagesController < ApplicationController
  def home
  end

  def magic_question
  end

  def magic_answer
    @message = params[:question]
    wisdom = ["It is certain", "It is decidedly so", "Without a doubt", "Yes definitely", "You may rely on it", "As I see it, yes", "Most likely", "Outlook good", "Yes", "Signs point to yes"]
    @response = wisdom.sample
  end


  def secret_question
  end



  def secret_answer
    @guess = params[:guess]
    @num = Random.rand(10)
    if (@guess == @num)
      @response = "Correct. Great and lucky guess"
    else
      @response = "Sorry, your guess is incorrect. Your guess #{@guess}. The number is #{@num}. The number will now reset..."
    end
  end

end
