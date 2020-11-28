require 'nokogiri'
require 'httparty'

# Scraper class
class Scraper
  attr_reader :arr, :news

  def initialize(url)
    @arr = []
    @unparsed_page = HTTParty.get(url)
    @parsed_page = Nokogiri::HTML(@unparsed_page)
    @news = @parsed_page.css('.recent-news').css('.news-block')
    scraper
    system('clear')
  end

  private

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

  def print1(title, date)
    puts "Title: #{title}\nDate: #{date}"
  end

  def print2(levels)
    puts "Urls:\n  Level 1: #{levels[0]['href']}"
    puts "  Level 2: #{levels[1]['href']}"
    puts "  Level 3: #{levels[2]['href']}\n\n"
  end

  def condition(date, summary)
    if date == summary[0..15]
      puts "Summary: #{summary[17..-1]}"
    else
      puts "Summary: #{summary}"
    end
  end

  public

  def print_articles
    @arr.each_with_index do |article, i|
      print "#{i + 1}: "
      print1(article[:title], article[:date])
      condition(article[:date], article[:summary])
      print2(article[:urls])
      sleep(1)
    end
  end
end
