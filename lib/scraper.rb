require 'nokogiri'
require 'watir'

# web scraping class
class Scraper
  attr_reader :link

  def initialize(link)
    @link = link
  end

  def start
    url = @link
    browser = ::Watir::Browser.new
    browser.goto(url)
    browser.element(css: 'li.ais-InfiniteHits-item').wait_until(&:present?)
    doc = browser.element(css: '#rendered-content')
    html_raw = doc.inner_html
    parsed_page = Nokogiri::HTML(html_raw)
    courses_list = parsed_page.css('div.card-content')
    pages(parsed_page, courses_list)
  end

  private

  def pages(parsed_page = nil, courses_list = nil)
    @page = 1
    per_page = courses_list.count
    per_page = 1 if per_page.zero?
    @total = parsed_page.css('h2.rc-NumberOfResultsSection span').text.gsub(/[^\d]/, '').to_i
    @last_page = (@total / per_page)
  end
end
