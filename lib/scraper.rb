require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    page = Nokogiri::HTML(html)
    cards = page.css(".student-card")
    store = []
    cards.each do |student|
      store << {name:student.css(".student-name").text, location: student.css(".student-location").text,profile_url:student.css("a").attribute("href").text}
    end
    return  store





  end

  def self.scrape_profile_page(profile_url)
    html = open(profile_url)
    page = Nokogiri::HTML(html)
    cards = page.css("div.social-icon-container")
    profile = {
      twitter: cards.css("a"[0]).attribute("href").text,
      linkedin: cards.css("a"[2]).attribute("href").text,
      github: cards.css("a"[2]).attribute("href").text,
      blog: cards.css("a"[2]).attribute("href").text,
    }
    puts profile
  end

end
