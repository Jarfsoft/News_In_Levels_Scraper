# Scraper class

require 'nokogiri'
require 'httparty'

class Scraper
  att_accessor :url, :parsed_page, :unparsed_page
  def initialize(url)
    @url = url
  end

  def scraper
    @unparsed_page = HTTParty.get(@url)
    @parsed_page = Nokogiri::HTML(@unparsed_page)

  end
end
