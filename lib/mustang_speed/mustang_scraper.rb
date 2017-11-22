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

  def self.mustang_scrape
    doc = Nokogiri::HTML(open("https://www.0-60specs.com/ford-mustang-0-60-times/"))
    binding.pry

  end

end
