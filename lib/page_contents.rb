# frozen_string_literal: true
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength

require_relative '../lib/scraper'

class Page < Scraper
  attr_reader :total, :page

  def initialize(total, page)
    @total = total
    @page = page
  end

  def start
    content_url = "https://www.coursera.org/search?query=free&page=#{@page}&index=prod_all_products_term_optimization"
    content_doc = ::Watir::Browser.new
    content_doc.goto(content_url)
    content_doc.element(css: 'li.ais-InfiniteHits-item').wait_until(&:present?)
    content_doc = content_doc.element(css: '#rendered-content')
    content_unparsed_page = content_doc.inner_html
    content_parsed_page = Nokogiri::HTML(content_unparsed_page)
    content_parsed_page.css('li.ais-InfiniteHits-item')
  end

  def scraper
    @list = []
    content_courses_list = start
    content_courses_list.each do |course_listing|
      courses = {
        url: "https://www.coursera.org/search?query=free#{course_listing.css('a.anchor-wrapper')[0].attributes['href'].value}", # rubocop:disable Layout/LineLength
        course: course_listing.css('h2.color-primary-text').text,
        partner: course_listing.css('span.partner-name').text,
        product: course_listing.css('div.product-type-row').text,
        enrollment: course_listing.css('div.rating-enroll-wrapper').text,
        level: course_listing.css('span.difficulty').text
      }
      @list.push(courses)
    end
    @page += 1
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
