require 'nokogiri'
require 'httparty'

# Scraper class
class Scraper
  att_accessor :arr
  att_reader :news
  def initialize(url)
    @arr = []
    @unparsed_page = HTTParty.get(url)
    @parsed_page = Nokogiri::HTML(@unparsed_page)
    @news = @parsed_page.css('.recent-news').css('.news-block')
    scraper
    system 'cls'
  end

  def scraper
    @news.each do |article|
      item = {
        title: article.css('.title').text,
        date: article.css('p').text,
        summary: article.css('.news-excerpt').text,
        urls: article.css('fancy-buttons').css('ul')
      }
      @arr.push(item)
    end
    @arr
  end
end
