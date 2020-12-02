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
    content_url = "https://www.coursera.org/courses?query=free#{page}"
    content_doc = ::OpenURI.open_uri(content_url)
    content_unparsed_page = content_doc.read
    content_parsed_page = Nokogiri::HTML(content_unparsed_page)
    content_parsed_page.css('div.card-content')
  end

  def scraper
    @list = []
    content_courses_list = start
    content_courses_list.each do |course_listing|
      courses = {
        url: course_listing.css('div.card-content').css('a')[0].attributes['href'].value,
        partner: course_listing.css('partner-logo-wrapper horizontal-box').css('span.partner-name').text,
        course_title: course_listing.css('a.color-primary-text card-title headline-1-text').text,
        enrollment: course_listing.css('div.rating-enroll-wrapper').css('span.enrollment-number').text,
        level: course_listing.css('div.product-difficulty').css('span.difficult').text
      }
      @list.push(courses)
    end
    @page += 1
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
