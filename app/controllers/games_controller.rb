require "open-uri"

class GamesController < ApplicationController

  def new
    @new_word = ('a'..'z').to_a.sample(10)
  end

  def score
    @new_word = params[:new_word]
    @user_input = params[:user_input]

    url = "https://dictionary.lewagon.com/#{@user_input}"
    response = URI.open(url)
    json = JSON.parse(response.read)

    if @user_input.chars.all?{ |word| @user_input.count(word) <= @new_word.count(word)}
    if json["found"]
      @result = "Congrats, your word #{@user_input} is within #{@new_word}."
    else
      @result = "Not in dictonary."
    end
  else
    @result = "Wrong."
  end
end
end
