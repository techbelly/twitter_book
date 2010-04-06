#!/usr/bin/env ruby
require 'date'

def fix(text)
  text.gsub!("&","&amp;")
  text.gsub!(", web,",'')
  text.gsub!(/#[0-9a-zA-Z_]*/) {|tag| "<hashtag>#{tag}</hashtag>" }
  text.gsub!(/@[0-9a-zA-Z_]*/) {|tag| "<name>#{tag}</name>" }
  text.gsub!(/http:\/\/[0-9A-Za-z_\/\.]*/) {|tag| "<link>#{tag}</link>" }
  text
end

cur_month = ""
cur_day = ""

puts "<tweets>"
while (tweet = gets) 
    date,text = tweet.split("\t")
    date = DateTime.strptime(date,"%A %d %B %Y at %I:%M%p")
    month = date.strftime("%B")
    day = date.strftime("%A %d %B")
    time = date.strftime("%I:%M%p").downcase
    
    new_month = (cur_month != month)
    new_day = (cur_day != day)
    
    if new_day
       puts "</day>" unless cur_day == ""
    end
    
    if new_month
        puts "</month>" unless cur_month == ""
        puts "<month name=\"#{month}\">"
        cur_month = month
    end
    
    if new_day
      puts "<day name=\"#{day}\">"
      cur_day = day
    end

    puts "<tweet>#{time}&#160;&#160;#{fix(text)}</tweet>"
end

puts "</day>"
puts "</month>"
puts "</tweets>"