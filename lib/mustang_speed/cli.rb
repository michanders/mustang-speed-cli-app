class MustangSpeed::CLI

  def start
    opening
    run
    play
    the_end
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


  def play_again?
    puts " "
    puts "Would you like to pick a different year? Y or N?"
    input = gets.chomp.downcase
    if input == "y"
      play
    else
      the_end
    end
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
    if @mustang.length <= 1
      puts " "
      puts "Only one trim available for the selected year:"
      puts " "
      puts "#{@mustang[0].name}:"
      puts "0-60: #{@mustang[0].to_sixty}"
      puts "1/4 mile: #{@mustang[0].quarter_mile}"
      play_again?
    else
      #display_specs_by_trim
    end
    binding.pry
  end

  def the_end
    puts " "
    puts "Thanks for playing! Have a nice day."
    exit
  end

end
