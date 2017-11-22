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

  def self.mustang_scrape
    doc = Nokogiri::HTML(open("https://www.0-60specs.com/ford-mustang-0-60-times/"))
    doc.css(".row tr").each do |stang|
      if stang.css(".column-6").text.length > 15
        mustang = self.new
        mustang.name = stang.css(".column-1").text
        mustang.year = "2017"
        mustang.to_sixty = stang.css(".column-5").text
        mustang.quarter_mile = stang.css(".column-6").text
        self.all << mustang
      end
    end
    binding.pry

  end

end
