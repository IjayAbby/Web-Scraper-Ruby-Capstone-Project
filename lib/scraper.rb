# frozen_string_literal: true

require 'nokogiri'
require 'byebug'
require 'colorize'
require 'rspec'
require 'rubocop'
require 'open-uri'

class Scraper
  attr_reader :link

  def init(link)
    @link = link
  end

  def start
    url = @link
    doc = ::OpenURI.open_uri(url)
    html_raw = doc.read
    parsed_page = Nokogiri::HTML(html_raw)
    courses_list = parsed_page.css('div.card-content')
    pages(parsed_page, courses_list)
  end

  private

  def pages(parsed_page = nil, courses_list = nil)
    @page = 1
    per_page = courses_list.count
    @total = parsed_page.css('h2.rc-NumberOfResultsSection body-2-text').text.gsub(',', '').to_i
    @last_page = (total.to_f / per_page.to_f).ceil
  end
end
