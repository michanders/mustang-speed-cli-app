class MustangSpeed::CLI

  def start
    opening
    run
    play
    finish
  end

  def run
    MustangSpeed::MustangScraper.years_available
    MustangSpeed::MustangScraper.mustang_scrape
    @years = MustangSpeed::MustangScraper.years
    @all = MustangSpeed::MustangScraper.all
  end

  def opening
    puts " "
    puts "Welcome to the Mustang 0-60 and 1/4 mile times, app."
  end

  def find_mustang_by_year(input)
    selected_year = []
    @all.each do |mustang|
      if mustang.year == input
        selected_year << mustang
      end
    end
    selected_year
  end

  def play
    puts " "
    puts "Please Enter a year: 1964 - 2017"
    input = gets.chomp
    if @years.include?(input)
      @mustang = find_mustang_by_year(input)
    else
      puts " "
      puts "That year is not available."
      play
    end
  end
    #shows list of available mustang trims based on user input
    # enter a number from numbered list of mustang trims from above year
    # get 0-60 and 1/4 mile times displayed
    # asks to pick new trim from same year
    # asks for a new year if above is no
    # ends if above is no

  def finish
    puts " "
    puts "Thanks for playing! Have a nice day."
    exit
  end

end
