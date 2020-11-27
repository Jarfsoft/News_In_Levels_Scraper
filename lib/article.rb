require 'nokogiri'
require 'httparty'

# Article class
class Article
  attr_reader :title, :content

  def initialize(url)
    @unparsed_page = HTTParty.get(url)
    @parsed_page = Nokogiri::HTML(@unparsed_page)
    @title = @parsed_page.css('.article-title').css('h2').text
    @content = @parsed_page.css('.nContent').css('p')
  end

  def print_article
    puts "#{@title}\n"
    content.each do |i|
      puts "#{i}\n"
    end
  end
end
