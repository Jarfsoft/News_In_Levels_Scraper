require 'nokogiri'
require 'httparty'

# Scraper class
class Scraper
  attr_accessor :arr
  attr_reader :news

  def initialize(url)
    @arr = []
    @unparsed_page = HTTParty.get(url)
    @parsed_page = Nokogiri::HTML(@unparsed_page)
    @news = @parsed_page.css('.recent-news').css('.news-block')
    scraper
    system('clear')
  end

  def scraper
    @news.each do |article|
      item = {
        title: article.css('.title').text.strip,
        date: article.css('p').text,
        summary: article.css('.news-excerpt').text.strip,
        urls: article.css('.fancy-buttons').css('ul').css('a')
      }
      @arr.push(item)
    end
    @arr
  end
end
