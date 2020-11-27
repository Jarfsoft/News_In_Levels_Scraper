#!/usr/bin/env ruby

require_relative '../lib/scraper'

def print_article(arr)
  arr.each do |article|
    print1(article[:title], article[:date])
    condition(article[:date], article[:summary])
    print2(article[:urls])
  end
end

def print1(title, date)
  puts "Title: #{title}"
  puts "Date: #{date}"
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

count = 1
url = ''
loop do
  url = 'https://www.newsinlevels.com/'
  if count > 1 then url = "#{url}page/#{count}/" end
  items = Scraper.new(url)
  print_article(items.arr)
  print 'Enter n to see more articles, any key to quit: '
  selection = gets.chomp
  count += 1
  break if selection != 'n'
end
