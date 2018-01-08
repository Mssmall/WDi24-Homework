class PagesController < ApplicationController

  def home
  end

  def numbers
    @amount = 234
    @large_number = 89354873287
    @phone = 2125551212

  end

  def text
    @numbers=(1..20).to_a
    @friend_count = 1
    @enemy_count = 15
    @story = "The quick brown fox jumps over the lazy dog"
    
  end

  def assets
  end

  def url
  end

end
