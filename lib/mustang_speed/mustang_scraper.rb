require "nokogiri"
require "pry"
require 'open-uri'

class MustangSpeed::MustangScraper
  attr_accessor :name, :year, :to_sixty, :quarter_mile

  @@all = []
  @@years = []

  def self.all
    @@all
  end

  def self.years
    @@years
  end

  def self.check_for_mustang(stang)
    x = true
    self.all.each do |car|
      if car.name == stang.name && car.year == stang.year
        x = false
      end
    end
    x
  end

  def self.years_available
    doc = Nokogiri::HTML(open("https://www.0-60specs.com/ford-mustang-0-60-times/"))
    doc.css(".row tr").css(".column-1 h2").each do |year|
      self.years << year.text.split.first
    end
  end

  def self.mustang_scrape
    doc = Nokogiri::HTML(open("https://www.0-60specs.com/ford-mustang-0-60-times/"))
    i = 0
    doc.css(".row tr").each do |stang|
      if stang.css(".column-6").text.length > 15
        mustang = self.new
        mustang.name = stang.css(".column-1").text
        mustang.year = self.years[i]
        mustang.to_sixty = stang.css(".column-5").text
        mustang.quarter_mile = stang.css(".column-6").text
        if self.check_for_mustang(mustang) == true
          self.all << mustang
        end
      else
        i += 1
      end
    end
    binding.pry
  end

end
