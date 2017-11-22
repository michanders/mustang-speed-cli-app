class MustangSpeed::CLI

  def start
    opening
    #run scraper to store objects in all
    play
    finish
  end

  def opening
    puts " "
    puts "Welcome to the Mustang 0-60 and 1/4 mile times, app."
  end

  def play
    puts "Please Enter a year: 1964 - 2017"
    #shows list of available mustang trims based on user input
    # enter a number from numbered list of mustang trims from above year
    # get 0-60 and 1/4 mile times displayed
    # asks to pick new trim from same year
    # asks for a new year if above is no
    # ends if above is no
  end

end
