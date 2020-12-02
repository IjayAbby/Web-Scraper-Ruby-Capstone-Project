# frozen_string_literal: true

# rubocop:disable Metrics/AbcSize

# rubocop:disable Metrics/MethodLength

require_relative '../lib/page_contents'
require 'colorize'
scraper = Scraper.new('https://www.coursera.org/search?query=free&index=prod_all_products_term_optimization')
scraper.start

def prompt
  puts "Would you like to continue to see more free courses? \n \n"
  puts "To continue \n Type 'y' or press 'Enter' \n \n"
  puts "To stop and quit \n Type 'n' or 'q' \n \n"
  loop do
    input = gets.chomp.downcase
    if ['y', ''].include?(input)
      @page += 1
      break
    elsif %w[n q].include?(input)
      puts " Good luck on your career choice! \n Thank you for using my scraper!)))".yellow.bold
      puts ' I see a bright future ahead!'.green.bold
      exit
    else
      puts "Oops! Invalid character! \n\n".red.bold
      puts "To continue \n Type 'y' \n \n"
      puts "To stop and quit \n Type 'n' \n \n"
      input
    end
    input
  end
end

def info
  @scraper = Scraper.new('https://www.coursera.org/search?query=free&index=prod_all_products_term_optimization')
  @scraper.start
  @total = @scraper.instance_variable_get(:@total)
  @last_page = @scraper.instance_variable_get(:@last_page)
  puts " Free available #{@total}  courses in #{@last_page} pages"
  sleep(1.5)
  @page = 1
  @collect = Pick.new(@total, @page)
end

def results
  info
  while @page <= @total
    puts "\t Page Number: #{@page} \n\n"
    sleep 0.5
    @collect.scraper
    list = @collect.instance_variable_get(:@list)
    i = 0
    while i < list.count
      puts "Found Free available courses \n\n"
      puts " Partner: #{list[i][:partner]}".yellow.bold
      puts " Course-title: #{list[i][:course_title]} \n Level: #{list[i][:level]}".orange.bold
      puts " Enrollment: #{list[i][:enrollment]}".green.bold
      puts " Course link: https://www.coursera.org/courses?query=free#{list[i][:url]}".cyan.bold
      puts ''
      sleep(0.1)
      i += 1
    end
    prompt
    sleep(0.5)
  end
end
results

# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
