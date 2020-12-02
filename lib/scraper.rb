# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require 'watir'

class Scraper
  attr_reader :link

  def initialize(link)
    @link = link
  end

  def start
    url = @link
    #doc = ::OpenURI.open_uri(url)
    browser = ::Watir::Browser.new
    browser.goto(url)
    browser.element(css: 'li.ais-InfiniteHits-item').wait_until(&:present?)
    doc = browser.element(css: '#rendered-content')
    html_raw = doc.inner_html
    #puts html_raw
    parsed_page = Nokogiri::HTML(html_raw)
    courses_list = parsed_page.css('div.card-content')
    puts courses_list.count
    pages(parsed_page, courses_list)
  end

  private

  def pages(parsed_page = nil, courses_list = nil)
    @page = 1
    per_page = courses_list.count
    per_page = 1 if per_page.zero?
    puts per_page
    @total = parsed_page.css('h2.rc-NumberOfResultsSection span').text.gsub(/[^\d]/, '').to_i
    puts @total
    @last_page = (@total / per_page)
    puts @last_page
  end
end
