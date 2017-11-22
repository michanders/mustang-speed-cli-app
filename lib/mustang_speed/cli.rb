class MustangSpeed::CLI

  def start
    opening
    run
    play
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


  def play_again_same_year
    puts " "
    puts "Would you like to pick a different trim of the same year? Y or N?"
    input = gets.chomp.downcase
    if input == "y"
      display_specs_by_trim
    else
      play_again?
    end
  end


  def display_specs_by_trim
    i = 1
    puts " "
    puts "Enter: #{i}-#{@mustang.length} to display 0-60 and 1/4 mile times."
    puts " "
    @mustang.each {|stang| puts "#{i}: #{stang.name}"; i += 1}
    puts " "
    input = gets.to_i
    mustang = @mustang[input - 1]
    if input > 0 && input <= @mustang.length
      puts " "
      puts "#{mustang.name}:"
      puts "0-60: #{mustang.to_sixty}"
      puts "1/4 mile: #{mustang.quarter_mile}"
    else
      puts " "
      puts "That trim is not available. Please pick another trim."
      display_specs_by_trim
    end
    play_again_same_year
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
      display_specs_by_trim
    end
    binding.pry
  end


  def the_end
    puts " "
    puts "Thanks for playing! Have a nice day."
    exit
  end
end
